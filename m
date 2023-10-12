Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2317C6B90
	for <lists.virtualization@lfdr.de>; Thu, 12 Oct 2023 12:52:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 894C4822CA;
	Thu, 12 Oct 2023 10:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 894C4822CA
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hi9u5ioU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LfrQKotCJ-ly; Thu, 12 Oct 2023 10:52:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 40E8A822BE;
	Thu, 12 Oct 2023 10:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40E8A822BE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79985C0DD3;
	Thu, 12 Oct 2023 10:52:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11A63C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Oct 2023 10:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9B584151B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Oct 2023 10:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9B584151B
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=hi9u5ioU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bo6UMOMTVOC5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Oct 2023 10:52:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62D854150E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Oct 2023 10:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62D854150E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697107969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WCc9mHbY2JlIHfp5VOa+l2dSwNloOuO6MCxzrGGXt3M=;
 b=hi9u5ioUIuLoP8YX55QHfILRGzOfcUDfWq+2WumE271KiXLiZYgA/GzTRD9o6Y+Vo+ojIx
 IDE+5jaRJMkHR6Eu0GIOvNXvP0GlvCtvQQ1Xlpbv8oS4dEwhw50yDz9z+/idVcrEEAFlxf
 Xo3zVqSBwJBENP32Iu4yh4sI8JQrhuw=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-gIMS5WEXMvSTMaOUBIZHDg-1; Thu, 12 Oct 2023 06:52:47 -0400
X-MC-Unique: gIMS5WEXMvSTMaOUBIZHDg-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-5043c463bf9so878223e87.0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Oct 2023 03:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697107966; x=1697712766;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WCc9mHbY2JlIHfp5VOa+l2dSwNloOuO6MCxzrGGXt3M=;
 b=ISzp7u5SB/a6IN9VElaceQ8JAws+z2nmiRwqFc8bp6qkwvsQvZIwp1L9YcQxSNhmdS
 hgF1Yvv4PVdS2NsD82gHMjjihhoDvxPO5SFJI9ocGjwqonF8GMYSracBgYp2JXOrk7mG
 hrpDNG/egtUYLTkqZYe/r/RtlHXSbwwtERq1oKTgbAiobbDy0uLus7VshG7Io+WPC/nK
 qmbbXSotVDboqEvC3Ycw645PVqgRK04CEDOtzS4cXo/lH2T9QxOxwfKplpc4sFVntLyp
 VTQXGx7FVP2HR6j2aodGS6CxRW6fx6J2DQc8FyC+ByrzgsqZrNZbaBH1vIuij1nhQSAo
 1K4Q==
X-Gm-Message-State: AOJu0Yw1T8/gmTQg4fHNWkcwv40LU6rKLMhScIRf81NwCfi4EFJmleSW
 5v5EUXEWwCO67Pl9EA8/HnimG/980xBB2Ra+jinv7QxlZcAxCl6hUDN1tMQ7GonCsfdH6fNsS69
 b27h4okOOtHs3wKQ9O+Zej+ZTp7z0NnrFd6egvAzhHw==
X-Received: by 2002:a05:6512:ba6:b0:503:2877:67d3 with SMTP id
 b38-20020a0565120ba600b00503287767d3mr23005978lfv.67.1697107966270; 
 Thu, 12 Oct 2023 03:52:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzbTERUF8xEQetm4cgeqjsxy3FbcXouW9Y3QzwsFZi3a1d6dHvi0j5cXFUujnC5oFhbcHqgw==
X-Received: by 2002:a05:6512:ba6:b0:503:2877:67d3 with SMTP id
 b38-20020a0565120ba600b00503287767d3mr23005953lfv.67.1697107965850; 
 Thu, 12 Oct 2023 03:52:45 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73d2:bf00:e379:826:5137:6b23])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a5d4cc4000000b003247d3e5d99sm17990316wrt.55.2023.10.12.03.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:52:45 -0700 (PDT)
Date: Thu, 12 Oct 2023 06:52:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH vfio 11/11] vfio/virtio: Introduce a vfio driver over
 virtio devices
Message-ID: <20231012065008-mutt-send-email-mst@kernel.org>
References: <20230921152802-mutt-send-email-mst@kernel.org>
 <20230921195345.GZ13733@nvidia.com>
 <20230921155834-mutt-send-email-mst@kernel.org>
 <CACGkMEvD+cTyRtax7_7TBNECQcGPcsziK+jCBgZcLJuETbyjYw@mail.gmail.com>
 <20230922122246.GN13733@nvidia.com>
 <PH0PR12MB548127753F25C45B7EFF203DDCFFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuX5HJVBOw9E+skr=K=QzH3oyHK8gk-r0hAvi6Wm7OA7Q@mail.gmail.com>
 <PH0PR12MB5481ED78F7467EEB0740847EDCFCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230925141713-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481AF4B2F61E96794D7ABC7DCC3A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481AF4B2F61E96794D7ABC7DCC3A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Maor Gottlieb <maorg@nvidia.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Jiri Pirko <jiri@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Sep 26, 2023 at 03:45:36AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, September 26, 2023 12:06 AM
> 
> > One can thinkably do that wait in hardware, though. Just defer completion until
> > read is done.
> >
> Once OASIS does such new interface and if some hw vendor _actually_ wants to do such complex hw, may be vfio driver can adopt to it.

The reset behaviour I describe is already in the spec. What else do you
want OASIS to standardize? Virtio currently is just a register map it
does not yet include suggestions on how exactly do pci express
transactions look. You feel we should add that?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
