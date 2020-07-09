Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E349121A3A0
	for <lists.virtualization@lfdr.de>; Thu,  9 Jul 2020 17:25:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6B09C87F08;
	Thu,  9 Jul 2020 15:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gL-_MkDp7IBf; Thu,  9 Jul 2020 15:25:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BA05287A0A;
	Thu,  9 Jul 2020 15:25:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99439C077B;
	Thu,  9 Jul 2020 15:25:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50A43C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 15:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3880A89A4A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 15:25:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id khZXE1tnoKL3
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 15:25:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 06CF189A42
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 15:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594308330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/FIvm+5jNb1Yu5G1MxSpTVfRDNWZlB63OHD7nzYJXlw=;
 b=ZFL9bD6hOHC1aDKtWus6hdHPTXIsfjGUrBUmmCgCx29/gk9ya4xaVjB95U55KjA8ld06ER
 e4m2qc6RaF+bhMVIpF9WKJ/zIMhrsXrYl7/58hNAQnh2z03dqW9kTH2216mv8Hk5q29mSp
 2cVTqpNxuXG03i4rT/PN9hzvkJjirTU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-nA4vgqecPIOgLEkwjzD_MA-1; Thu, 09 Jul 2020 11:25:29 -0400
X-MC-Unique: nA4vgqecPIOgLEkwjzD_MA-1
Received: by mail-wm1-f72.google.com with SMTP id y204so2489942wmd.2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 09 Jul 2020 08:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/FIvm+5jNb1Yu5G1MxSpTVfRDNWZlB63OHD7nzYJXlw=;
 b=duFzVEAXWqDvromnyMWtTalJ2t000yxkx2LfK2P8HuvqbbgPOqgZJiwsXM5Q9FIflC
 DeSlTW/Pqcr0zGFKRTCXJSUpSqPbBoLfRM2BhT691qonie/7SErVb1DCXTmmvs5UlIfi
 MsWR27fX+NGIjU1843Lxi+joz7EMGQedpfIe6E+PvgtB0ZoEU/2N9A8s7q7P0coo5ZbQ
 2bqOdV3fXWgbmwFbMRwPA8F1fvi3ZWQQtLyutsJ4IIsk3yckrkX6oZ2zp0/QOZ1EVXJ/
 R4zAvtg8XDlqF1QwzELrwBCxb1f7L4t4vr2NKe6x7SgpxP9WuJgYK2SplVCaauO2hlmu
 vFKA==
X-Gm-Message-State: AOAM531fpyXhLp5ilI4jIQQO4g151YQ8+q6aorAvp1PqYglYa1SPaBFl
 88cowy1LtcMlR5qiVv9lSiFZxLgA1UOYfl+GY8mpvdraTGYjcmDPFDV4xZm9SA0VuazlDGSAIC0
 +r2Pvpy8qyZvstuceFoGrFJ4SCjfJNRFSDr0B/b4pKw==
X-Received: by 2002:a1c:80c8:: with SMTP id b191mr526241wmd.37.1594308325419; 
 Thu, 09 Jul 2020 08:25:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhZrc+0TzNQ/ccjoCs5+EUyUE8e7OC8ViXIGngOlNVN0t1E7FQYjBTOJ4J4jy+ehCF5fUcyA==
X-Received: by 2002:a1c:80c8:: with SMTP id b191mr526222wmd.37.1594308325223; 
 Thu, 09 Jul 2020 08:25:25 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c?
 ([2001:b07:6468:f312:9541:9439:cb0f:89c])
 by smtp.gmail.com with ESMTPSA id e23sm4951923wme.35.2020.07.09.08.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 08:25:24 -0700 (PDT)
Subject: Re: [PATCH] scsi: virtio_scsi: remove unnecessary condition check
To: Xianting Tian <xianting_tian@126.com>, mst@redhat.com,
 jasowang@redhat.com, stefanha@redhat.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com
References: <1594307167-8807-1-git-send-email-xianting_tian@126.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d7a9319b-37ec-95dd-c20c-76017a3b1699@redhat.com>
Date: Thu, 9 Jul 2020 17:25:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1594307167-8807-1-git-send-email-xianting_tian@126.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

On 09/07/20 17:06, Xianting Tian wrote:
> kmem_cache_destroy and mempool_destroy can correctly handle
> null pointer parameter, so there is no need to check if the
> parameter is null before calling kmem_cache_destroy and
> mempool_destroy.
> 
> Signed-off-by: Xianting Tian <xianting_tian@126.com>
> ---
>  drivers/scsi/virtio_scsi.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/scsi/virtio_scsi.c b/drivers/scsi/virtio_scsi.c
> index bfec84a..54ac83e 100644
> --- a/drivers/scsi/virtio_scsi.c
> +++ b/drivers/scsi/virtio_scsi.c
> @@ -1003,14 +1003,10 @@ static int __init init(void)
>  	return 0;
>  
>  error:
> -	if (virtscsi_cmd_pool) {
> -		mempool_destroy(virtscsi_cmd_pool);
> -		virtscsi_cmd_pool = NULL;
> -	}
> -	if (virtscsi_cmd_cache) {
> -		kmem_cache_destroy(virtscsi_cmd_cache);
> -		virtscsi_cmd_cache = NULL;
> -	}
> +	mempool_destroy(virtscsi_cmd_pool);
> +	virtscsi_cmd_pool = NULL;
> +	kmem_cache_destroy(virtscsi_cmd_cache);
> +	virtscsi_cmd_cache = NULL;
>  	return ret;
>  }
>  
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
