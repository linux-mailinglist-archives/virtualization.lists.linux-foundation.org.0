Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 945A8579FDB
	for <lists.virtualization@lfdr.de>; Tue, 19 Jul 2022 15:40:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE49082640;
	Tue, 19 Jul 2022 13:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE49082640
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gkhulk5u
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sQ62FDr4ExCY; Tue, 19 Jul 2022 13:40:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7588583083;
	Tue, 19 Jul 2022 13:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7588583083
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B311DC0078;
	Tue, 19 Jul 2022 13:40:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 395BAC002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jul 2022 13:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0464A400F6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jul 2022 13:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0464A400F6
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=gkhulk5u
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7CpmW_Jhh_cv
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jul 2022 13:40:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DF9740C38
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DF9740C38
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jul 2022 13:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658238042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zYKWxov5b3QhOWHv5mWiGxofQbQJXiKRAzRsuTWa0is=;
 b=gkhulk5uLdiWloSqboxVyaSzGOKEIuq2VtKSjXVtmMjNcV8wEO9KYEsRaWo0ikVyXPjgZh
 7+4FNNbjyhRo5lMVwxN+VtS3UlEkW/psn9j2VaXYw4r8Gi1eprIXqM6CaNVk81rRObeoWf
 VH22UbCdyrFNuJ/zYMIreNQAu7g2/pY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-cEALKG79P6qNmIGtxqqDkw-1; Tue, 19 Jul 2022 09:40:40 -0400
X-MC-Unique: cEALKG79P6qNmIGtxqqDkw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r82-20020a1c4455000000b003a300020352so6215289wma.5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jul 2022 06:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zYKWxov5b3QhOWHv5mWiGxofQbQJXiKRAzRsuTWa0is=;
 b=wrezsovr4rzS/V4RfHzCb1mP5DDRrunCEYvB6BKXASushveSyadYHG/nYvk5RSMHpY
 sAcZ8yhSa7gGPP8bsPT6lzJsC33xXmP6m8lMRJUtwtBY/StTeULtbZR3jIRJ3XhPr4v/
 8j+DytN6HcjGg/lPoIdjnIRAyrDGkBE2D7kkJoF8eBqU5OY287/pp2ptJuJCh9nWVO+B
 qYvds4h/db7dNo4ERkP4K9VDKiGOnHcXH6iZnYEdGRMV7oiSYTmfVu3rfzBSJcEaaNGt
 di6/l708P6xFIqvk/zSVemoAicIqryIONEbzUnxs/yEuOE/PSv/yue308K83WKcSgXqq
 0pwQ==
X-Gm-Message-State: AJIora8OXQvulqsaVwgT6zIedpzASl9raM8Zpt7CDgbNemczC13+b6U/
 KfJ5mrJ1Mz4tbvU/Mmf56LJ1hIAkV/rkWo8og9hrLrSTWmtnJs8LqGioGNSdWTJA8cPtR0xDeJg
 G523pN5Ls5+oalRkssIAs2xA6wkfRiodgfrb6tin1cQ==
X-Received: by 2002:a05:600c:3b07:b0:3a3:1433:10b5 with SMTP id
 m7-20020a05600c3b0700b003a3143310b5mr14065395wms.129.1658238039446; 
 Tue, 19 Jul 2022 06:40:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v5erLzTfjOBvJQouov2nBt7L0W19mj8+lVBMG7iwgHU4osFcrDq0b7eXXIN4e1QauTIS8b1g==
X-Received: by 2002:a05:600c:3b07:b0:3a3:1433:10b5 with SMTP id
 m7-20020a05600c3b0700b003a3143310b5mr14065381wms.129.1658238039249; 
 Tue, 19 Jul 2022 06:40:39 -0700 (PDT)
Received: from redhat.com ([2.55.25.63]) by smtp.gmail.com with ESMTPSA id
 v6-20020adfe4c6000000b0021e0147da47sm7987791wrm.96.2022.07.19.06.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 06:40:38 -0700 (PDT)
Date: Tue, 19 Jul 2022 09:40:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eli Cohen <elic@nvidia.com>
Subject: Re: VIRTIO_NET_F_MTU not negotiated
Message-ID: <20220719093841-mutt-send-email-mst@kernel.org>
References: <DM8PR12MB5400869D5921E28CE2DC7263AB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM8PR12MB5400869D5921E28CE2DC7263AB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
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

On Tue, Jul 19, 2022 at 01:25:42PM +0000, Eli Cohen wrote:
> Hi,
> 
>  
> 
> mlx5_vdpa is offering VIRTIO_NET_F_MTU. However the driver (is it qemu
> responsibility?) does not accept and it ends up not negotiated.

qemu is responsible for passing features to driver.

>  
> 
> I don't see how can the driver refuse to negotiate this. What if the hardware
> has a limitation with respect to mtu?

Then it can fail FEATURES_OK

>  
> 
> I noticed this when I created the device with mtu of 1000. I expected the
> netdev at the vm to have mtu of 1000 and any attempt to go beyond should fail
> but that's not the case.
> 
>  
> 
> Comments?


Any chance mtu is too small?

        if (virtio_has_feature(vdev, VIRTIO_NET_F_MTU)) {
                int mtu = virtio_cread16(vdev,
                                         offsetof(struct virtio_net_config,
                                                  mtu));
                if (mtu < MIN_MTU)
                        __virtio_clear_bit(vdev, VIRTIO_NET_F_MTU);
        }

any chance it's on power or another BE system?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
