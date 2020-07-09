Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D9721A3A7
	for <lists.virtualization@lfdr.de>; Thu,  9 Jul 2020 17:26:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7FF308840B;
	Thu,  9 Jul 2020 15:26:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fLraCSW1bpyF; Thu,  9 Jul 2020 15:26:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0C16588431;
	Thu,  9 Jul 2020 15:26:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4D66C016F;
	Thu,  9 Jul 2020 15:26:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B499C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 15:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 67A672C31B
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 15:26:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6GjT2IzbeZbr
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 15:26:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 730DA2701D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 15:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594308391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yld9cODJlBHmX+0+k8U+y9B+t1vzYK9Zv/haolnPDn0=;
 b=KFOX3IMIFVymJ+c8cpvsN2z/cP1xgNw598KAXVqCJKa5mwU3a1ci5gkhGfVXY257C9bkTC
 YczYF6mtbFMfQ1IguMoR3LEY4nzpSLSjB7n0o/GhT9j0N2oO1ZZbYF19soQsElPTOowitk
 P1VZkKnLbr7Olq6MJCb8aSFgYirPZ08=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-WJcWJEAuPQG9IQ3_3xR2HA-1; Thu, 09 Jul 2020 11:26:29 -0400
X-MC-Unique: WJcWJEAuPQG9IQ3_3xR2HA-1
Received: by mail-wm1-f70.google.com with SMTP id b13so2459180wme.9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 09 Jul 2020 08:26:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yld9cODJlBHmX+0+k8U+y9B+t1vzYK9Zv/haolnPDn0=;
 b=r9T/+6+ct93cMm6xm1HqZ8Zju4/76i/xX/C2sgqAhOzxBC3Mq5R7BloVnczd8bzXdv
 N66aVIAjVIUzr/lKYflb7hboViUTUW1vUwvbFjsyDubaIJmM+1jTvz5IrgvOfYN7JJt6
 mAO+LfEfuU09bfv6gNr1iXjGLLGGPdrNDHIoeUL3AubsaoetIAjkvKpE9a/mjq7V0vJJ
 ablB/ystHVyVXcYY1bqCLX3aH7jggd//MJl1m3mYZ9lpkzVO/DcZFLoJ7gzCDoB+PodD
 bQuf8krhKulRthnpBOmc1gLTqHDnxC0y/8QmkQtFflpVam7rI4W4PxEVhzh5xEQNoMCb
 xhkg==
X-Gm-Message-State: AOAM531QhswBtlLx0W/vnxkTzo+iltVD1TRhIIJL6YmGKI9HVdIeOiGQ
 vf16wrU+Tp+IuVFRuFp6uTQ6ayDrI3pNFNhpH1Fp5r/3vXWPiPntcLOHzJ3IB9IsaOx4OFTXFbf
 MDCOyq40cTMZP217Ju9pFpYysIcp4CJ6ewDpHeaMGlA==
X-Received: by 2002:a1c:7313:: with SMTP id d19mr500865wmb.147.1594308388637; 
 Thu, 09 Jul 2020 08:26:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7dLDkZ4/BZL2j48IHZwmCZYpcCKvTnAn2jv2FLYWLH187tJjjXAZRllb881rA5jAJPriTPw==
X-Received: by 2002:a1c:7313:: with SMTP id d19mr500850wmb.147.1594308388450; 
 Thu, 09 Jul 2020 08:26:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c?
 ([2001:b07:6468:f312:9541:9439:cb0f:89c])
 by smtp.gmail.com with ESMTPSA id g14sm6012304wrm.93.2020.07.09.08.26.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 08:26:27 -0700 (PDT)
Subject: Re: [PATCH] scsi: virtio_scsi: remove unnecessary condition check
To: Xianting Tian <xianting_tian@126.com>, mst@redhat.com,
 jasowang@redhat.com, stefanha@redhat.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com
References: <1594305992-8458-1-git-send-email-xianting_tian@126.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6e8405da-b960-f4f7-b46b-442ddab8d983@redhat.com>
Date: Thu, 9 Jul 2020 17:26:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1594305992-8458-1-git-send-email-xianting_tian@126.com>
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

On 09/07/20 16:46, Xianting Tian wrote:
> kmem_cache_destroy can correctly handle null pointer parameter,
> so there is no need to check if the parameter is null before
> calling kmem_cache_destroy.
> 
> Signed-off-by: Xianting Tian <xianting_tian@126.com>
> ---
>  drivers/scsi/virtio_scsi.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/scsi/virtio_scsi.c b/drivers/scsi/virtio_scsi.c
> index bfec84a..5bc288f 100644
> --- a/drivers/scsi/virtio_scsi.c
> +++ b/drivers/scsi/virtio_scsi.c
> @@ -1007,10 +1007,8 @@ static int __init init(void)
>  		mempool_destroy(virtscsi_cmd_pool);
>  		virtscsi_cmd_pool = NULL;
>  	}
> -	if (virtscsi_cmd_cache) {
> -		kmem_cache_destroy(virtscsi_cmd_cache);
> -		virtscsi_cmd_cache = NULL;
> -	}
> +	kmem_cache_destroy(virtscsi_cmd_cache);
> +	virtscsi_cmd_cache = NULL;
>  	return ret;
>  }
>  
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
