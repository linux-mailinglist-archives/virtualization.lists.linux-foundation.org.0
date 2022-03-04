Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 394074CD897
	for <lists.virtualization@lfdr.de>; Fri,  4 Mar 2022 17:06:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E20641620;
	Fri,  4 Mar 2022 16:06:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cFlDnXLsDz1v; Fri,  4 Mar 2022 16:06:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 553584167E;
	Fri,  4 Mar 2022 16:06:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D32AAC0070;
	Fri,  4 Mar 2022 16:06:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1DF31C000B
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Mar 2022 16:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 063D384187
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Mar 2022 16:06:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PuTJPd9Qk91W
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Mar 2022 16:06:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 598CE84186
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Mar 2022 16:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646409981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VqVeLATRmybF86qJrwFpma3w+r3XJIAwjHM8LLN3x9U=;
 b=Zr/aO+YkKXOEat1F5WgbBcJoj7giQ08gEc+x2r/aaM3Rya6AfnQH4VYoAAMmDllipR4cWx
 Y+BoKay82SnOeGj6V7FPK992hwpDhPjbAIf/NHwaeqNSycJ9xkAgf67J8tBH78wdFhpVC9
 e0sjBsUOY1LjUgPi4NDNoH1Uj+zR5Go=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-VzR6T8aKO9utf_Rx0h3ktg-1; Fri, 04 Mar 2022 11:06:20 -0500
X-MC-Unique: VzR6T8aKO9utf_Rx0h3ktg-1
Received: by mail-ej1-f70.google.com with SMTP id
 qf24-20020a1709077f1800b006ce8c140d3dso4627250ejc.18
 for <virtualization@lists.linux-foundation.org>;
 Fri, 04 Mar 2022 08:06:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VqVeLATRmybF86qJrwFpma3w+r3XJIAwjHM8LLN3x9U=;
 b=fz/ewjxD/q2RFqIW5Vd+d+styELeoQm0EEvjDBtCEQkkxIbc06Dp6RnPp60DXYFaD1
 oT9WL/VjE9LomNCMMCbH5SkocJHRsTGVDHE08Hc7oH/KkiNBEZtSU8LsmGEhoOnDlmwC
 7HCPoCgXArwYTHSRcU+nAzrFCBmetAcj9gb+JP0LGICG2C1btryg25+Eloc/Qb3a36B3
 bO3piDvHdcovbcT16nGQjUFhBKRMjduZMFCAZRjQvqW2M7tJJ6sA524gInWHtQLLLE4S
 na+tyY/KfEACzYF4CtbnHboGp/Fs8TPqiJtwRMTGniNkCzxSFeSmtdqK43WlclzBPpRO
 EVtA==
X-Gm-Message-State: AOAM533n7p1MnAkBftLvRSG0W1mU92BkVAi55dsSUyCuHH6i2+7iF91S
 QRuaVy7U8OCtX/F0PeTHfgL/DxYL4k7Xfuk/G4TwwMcuUkcHX/GTFlpkXurRnSExp8Ikk6jbIy7
 rV3dgT0LEYc4Aix7w2rsTSWyXHrCtlYgL8rsHwWzWnQ==
X-Received: by 2002:a05:6402:524e:b0:410:dedd:ea37 with SMTP id
 t14-20020a056402524e00b00410deddea37mr22476384edd.260.1646409978899; 
 Fri, 04 Mar 2022 08:06:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsfem+MurYZ/L/CdsBo3oSIp2PCHG82yteM20PR5ON4K7EBzuy0dCwKcJ0xSxIj6ACd2n/xw==
X-Received: by 2002:a05:6402:524e:b0:410:dedd:ea37 with SMTP id
 t14-20020a056402524e00b00410deddea37mr22476361edd.260.1646409978654; 
 Fri, 04 Mar 2022 08:06:18 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 el9-20020a170907284900b006cf8e3c83e3sm1958487ejc.168.2022.03.04.08.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 08:06:17 -0800 (PST)
Date: Fri, 4 Mar 2022 11:06:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eli Cohen <elic@nvidia.com>
Subject: Re: [PATCH v1 0/2] Show statistics for a vdpa device
Message-ID: <20220304110555-mutt-send-email-mst@kernel.org>
References: <20220216080022.56707-1-elic@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20220216080022.56707-1-elic@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: lvivier@redhat.com, virtualization@lists.linux-foundation.org,
 eperezma@redhat.com, si-wei.liu@oracle.com
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

On Wed, Feb 16, 2022 at 10:00:20AM +0200, Eli Cohen wrote:
> The following two patch series adds support to read vendor statistics
> for a vdpa device.
> 
> The first patch lays the ground to allow an upstream driver to provide
> statistics in the form of an attribute name/attribute value pairs.
> 
> The second patch implements this for mlx5_vdpa which gives received
> descriptors and completed descriptors information for all the
> virtqueues. 
> 
> V0 -> V1:
> 1. Function name changes to emphasize the fact that this is for vendor
> statistics.
> 2. Increase the size of VDPA_ATTR_DEV_QUEUE_INDEX to U32 so it can
> handle the entire range of virtqueue indices. 
> 3. Change output string names to avoid abbreviations.

Jason had a minor comment. Were you goint to address it?

> Eli Cohen (2):
>   vdpa: Add support for querying vendor statistics
>   vdpa/mlx5: Add support for reading descriptor statistics
> 
>  drivers/vdpa/mlx5/core/mlx5_vdpa.h |   2 +
>  drivers/vdpa/mlx5/net/mlx5_vnet.c  | 156 +++++++++++++++++++++++++++++
>  drivers/vdpa/vdpa.c                | 129 ++++++++++++++++++++++++
>  include/linux/mlx5/mlx5_ifc.h      |   1 +
>  include/linux/mlx5/mlx5_ifc_vdpa.h |  39 ++++++++
>  include/linux/vdpa.h               |   5 +
>  include/uapi/linux/vdpa.h          |   7 ++
>  7 files changed, 339 insertions(+)
> 
> -- 
> 2.34.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
