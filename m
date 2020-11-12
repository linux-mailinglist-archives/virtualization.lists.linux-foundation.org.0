Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FC22B0837
	for <lists.virtualization@lfdr.de>; Thu, 12 Nov 2020 16:14:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A00EE85522;
	Thu, 12 Nov 2020 15:14:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y7bO78cTLr71; Thu, 12 Nov 2020 15:14:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D3BCA87169;
	Thu, 12 Nov 2020 15:14:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9EEBC016F;
	Thu, 12 Nov 2020 15:14:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79EA4C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 15:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 750708679A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 15:14:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QhEA9qy6IdF2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 15:14:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B7EE986B89
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 15:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605194067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fWIN7/Nq/yeoyKpiKidMDeDSC6wVzNUm+jANJbo9SZs=;
 b=gTt9EwWQSy+HBxxGZGYdpYohCxrfy+kqggJoBVmczwqsyLXf2WemCwAg6+gsd8OsCJAkur
 jgNbXiQxfD4e3QxKAImU5kh0GRF1vETCRJ+FsRJMgDuicqS3bLNxQLnDyDipYVX8gZmNkd
 iVhc7rgWeByvBW6j3qN2A4eL2w0AHfk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-SWCNcrUAO02CqagPUvoMiA-1; Thu, 12 Nov 2020 10:14:26 -0500
X-MC-Unique: SWCNcrUAO02CqagPUvoMiA-1
Received: by mail-wr1-f69.google.com with SMTP id d8so2064903wrr.10
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 07:14:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=fWIN7/Nq/yeoyKpiKidMDeDSC6wVzNUm+jANJbo9SZs=;
 b=YpRoNV0aOdKb5dajvMyIaXg6iqVAdZAmglTgv1eRMwTGoAxOLPzNmniHenfyKfWvqb
 dfbo4FAg/vijKwI/dp9saETawGSz5dFAG+Rx9RTGelJDESFz/cVj78mgoVB3uswMssjR
 /sesBdwZftd8i3W8i1JWro9CIgzIQWg5fEJazFZ+bCd+JepcDBrQL/m742YH5xAL3Cmc
 i4IsDrFslg8ZswLj5MDhj3a6egK8UunPYrOYHAgYAu1CyN1fa94c4H/jB8I5RdE0tJeQ
 jRJmwv5WVUjKXnXd3tot/6SfPgLV7aPz4QzfBGONTlk18jIW8dRxtwoXdRCKxtAUwRYg
 wM1A==
X-Gm-Message-State: AOAM531nprYmlsViPnqotRtez7DSANGRLudcBjGJoD+DexLNhjbspSXJ
 lTpXCS3QVcSbGPULlnM6RRiea4JyMAsBJnfpgeREmf7KgYB2xA/5QbU8Dn1aut26B3qSb3vrM4f
 uJ9N17GR176ERsnEgayTpCdmp8H4ddOn+D2DEOsnihQ==
X-Received: by 2002:adf:c547:: with SMTP id s7mr6957wrf.222.1605194064913;
 Thu, 12 Nov 2020 07:14:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCi+qMEnYo3Z4at9GKUxuCuJdHsy/Kwa2RjJxcMb5RiR3KRPrzSMM5oNvlfzZNkCS6x5Cx5g==
X-Received: by 2002:adf:c547:: with SMTP id s7mr6912wrf.222.1605194064609;
 Thu, 12 Nov 2020 07:14:24 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id f8sm7541222wrt.88.2020.11.12.07.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 07:14:24 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Wei Liu <wei.liu@kernel.org>, Linux on Hyper-V List
 <linux-hyperv@vger.kernel.org>
Subject: Re: [PATCH v2 01/17] asm-generic/hyperv: change
 HV_CPU_POWER_MANAGEMENT to HV_CPU_MANAGEMENT
In-Reply-To: <20201105165814.29233-2-wei.liu@kernel.org>
References: <20201105165814.29233-1-wei.liu@kernel.org>
 <20201105165814.29233-2-wei.liu@kernel.org>
Date: Thu, 12 Nov 2020 16:14:22 +0100
Message-ID: <87mtzmy5dd.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Arnd Bergmann <arnd@arndb.de>, Haiyang Zhang <haiyangz@microsoft.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Michael Kelley <mikelley@microsoft.com>,
 Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 virtualization@lists.linux-foundation.org,
 Vineeth Pillai <viremana@linux.microsoft.com>
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

Wei Liu <wei.liu@kernel.org> writes:

> This makes the name match Hyper-V TLFS.
>
> Signed-off-by: Wei Liu <wei.liu@kernel.org>
> ---
>  include/asm-generic/hyperv-tlfs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/asm-generic/hyperv-tlfs.h b/include/asm-generic/hyperv-tlfs.h
> index e73a11850055..e6903589a82a 100644
> --- a/include/asm-generic/hyperv-tlfs.h
> +++ b/include/asm-generic/hyperv-tlfs.h
> @@ -88,7 +88,7 @@
>  #define HV_CONNECT_PORT				BIT(7)
>  #define HV_ACCESS_STATS				BIT(8)
>  #define HV_DEBUGGING				BIT(11)
> -#define HV_CPU_POWER_MANAGEMENT			BIT(12)
> +#define HV_CPU_MANAGEMENT			BIT(12)
>  
>  
>  /*

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

-- 
Vitaly

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
