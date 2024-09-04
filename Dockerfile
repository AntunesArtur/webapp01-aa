# # Use the .NET SDK image to build and run the app
# FROM mcr.microsoft.com/dotnet/sdk:8.0 

# # Set the working directory
# WORKDIR /app

# # Copy everything to the container para a pasta criada "app" ou para a raiz se não se criar a pasta
# COPY . ./

# # o mesmo que apt get
# RUN dotnet restore

# # para criar um executável da aplicação (o segundo release é o nome da pasta)
# RUN dotnet publish -c Release -o release

# # pasta de trabalho
# WORKDIR /app/release

# ENTRYPOINT ["dotnet", "WebApp01.dll"]

# #para definir porta que o container está a usar
# EXPOSE 8080


#Use the .NET SDK image to build and run the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
# Set the working directory
WORKDIR /app
# Copy everything to the container para a pasta criada "app" ou para a raiz se não se criar a pasta
COPY . ./
RUN dotnet restore
RUN dotnet publish -c Release -o /app/out

FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "WebApp01.dll"]

#para definir porta que o container está a usar
EXPOSE 8080


