Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 939262F91BE
	for <lists.virtualization@lfdr.de>; Sun, 17 Jan 2021 11:30:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4AC2287170;
	Sun, 17 Jan 2021 10:30:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rhXOppFOc4pB; Sun, 17 Jan 2021 10:30:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C68A287168;
	Sun, 17 Jan 2021 10:30:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F448C013A;
	Sun, 17 Jan 2021 10:30:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 985FDC013A
 for <virtualization@lists.linux-foundation.org>;
 Sun, 17 Jan 2021 10:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 869BB85D78
 for <virtualization@lists.linux-foundation.org>;
 Sun, 17 Jan 2021 10:30:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9hfyYrrKc2u9
 for <virtualization@lists.linux-foundation.org>;
 Sun, 17 Jan 2021 10:30:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CEDC285E51
 for <virtualization@lists.linux-foundation.org>;
 Sun, 17 Jan 2021 10:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610879408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tml6sHp1NjNR0HFEv3Pcp5mMcpBNidTf8muhn4StX7M=;
 b=N2OdTdiBjXUVRYujK6+8kiWEnWRd0ZsBAtbQ8w8Nu404QGlTsoulsB2AuNzCqC0hlcMdbD
 VQjtoui0EhfyRFITpbFrO+sIUXkcDqe0+ewRSST4GseUhcm5pGXbOni1W1+jS72wx1H4uU
 u+iDXXEY0I93gQVQZUGTdMplU7lMMx8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-bd6e3-aENXGr8FC3WKz7HA-1; Sun, 17 Jan 2021 05:30:06 -0500
X-MC-Unique: bd6e3-aENXGr8FC3WKz7HA-1
Received: by mail-wr1-f71.google.com with SMTP id q18so6715885wrc.20
 for <virtualization@lists.linux-foundation.org>;
 Sun, 17 Jan 2021 02:30:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tml6sHp1NjNR0HFEv3Pcp5mMcpBNidTf8muhn4StX7M=;
 b=SMdb3LwBVd0sq8cAoOQyBKsTt4oHfIfvdtDgrfB6VHwM8lnicJn8TDwvTFvMekA+zj
 8ZuruhSWBPQ+uAVGtZhIHRySCLVH0tnWJJPrYi6DXYRhpUs2P+qM+xzWRSJhf1fZllbY
 lhRLE9nf97FguW67m9H0D8Rgr9UASbZ8sgHb0AZ6jvwl2YvyMRTy8nweq47wiaf7InJo
 FNtWyE6Ku4kjniK+Xrgk5ndy+8nxpUDGMVCsihPGVICiYiPRsYp39BbWKlRm72vuKOGu
 0vsgcnxMcGSjM9LKX4+WTfknrk0h/Wb2PjbB5mBUGoojNjDOMf2eHgg11Y855XnEiAFc
 ZvQQ==
X-Gm-Message-State: AOAM533jRcSZBsht46M2AnVQV2j7dy1Rzwxd5mlw8TSsnICZC2utfeKh
 mO1lsTbJdpo1LKW7zrJ+dN8r29cBxuMr6eiDTfGTNPuLPp/dUYpHZWNNQo47pD2FPEuFKifoTFy
 x0uvGcixIa/MgcLdYAC+aOcUHIDHYUrEIFrJfjt02Vg==
X-Received: by 2002:a5d:4ece:: with SMTP id s14mr20882389wrv.427.1610879405574; 
 Sun, 17 Jan 2021 02:30:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJOkl7BSAtfyHjEVk7fCu1bVnGq2uHZD9z4fBmoWEo/nxSjQ1VfYa4asP46KP2Zq+ue0UrfA==
X-Received: by 2002:a5d:4ece:: with SMTP id s14mr20882379wrv.427.1610879405440; 
 Sun, 17 Jan 2021 02:30:05 -0800 (PST)
Received: from redhat.com (bzq-79-176-30-58.red.bezeqint.net. [79.176.30.58])
 by smtp.gmail.com with ESMTPSA id
 c20sm18850213wmb.38.2021.01.17.02.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 02:30:04 -0800 (PST)
Date: Sun, 17 Jan 2021 05:30:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2] mlx5: vdpa: fix possible uninitialized var
Message-ID: <20210117052810-mutt-send-email-mst@kernel.org>
References: <20210114070904.9981-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210114070904.9981-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: elic@nvidia.com, linux-kernel@vger.kernel.org,
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

On Thu, Jan 14, 2021 at 03:09:04PM +0800, Jason Wang wrote:
> When compiling with -Werror=maybe-uninitialized, gcc may complains the
> possible uninitialized umem. Since the callers won't pass value other
> than 1 to 3, making 3 as default to fix the compiler warning.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>

Of course if it's actually something else this is not DTRT ...
As long as we worry about this warning, let's have defence in depth:
  	case 3:
  		umem = &mvq->umem3;
  		break;
 +	default:
 +		umem = NULL;
 +              BUG();
 +		break;


> ---
>  drivers/vdpa/mlx5/net/mlx5_vnet.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> index f1d54814db97..07ccc61cd6f6 100644
> --- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
> +++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> @@ -703,7 +703,7 @@ static void umem_destroy(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_virtqueue
>  	case 2:
>  		umem = &mvq->umem2;
>  		break;
> -	case 3:
> +	default:
>  		umem = &mvq->umem3;
>  		break;
>  	}
> -- 
> 2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
