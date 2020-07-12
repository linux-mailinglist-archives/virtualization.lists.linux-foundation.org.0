Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9557F21CB81
	for <lists.virtualization@lfdr.de>; Sun, 12 Jul 2020 23:06:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4EBF488F86;
	Sun, 12 Jul 2020 21:06:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pY9EZgqPEL2t; Sun, 12 Jul 2020 21:06:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BD99E8995F;
	Sun, 12 Jul 2020 21:06:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91697C0733;
	Sun, 12 Jul 2020 21:06:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B45F6C0733
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Jul 2020 21:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9DD01886B5
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Jul 2020 21:06:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pa+SClYMYVeY
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Jul 2020 21:06:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 820BC88660
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Jul 2020 21:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594587995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L5r9lMKl+VedPwyqojqtAlh/T45L5HzUK3cN3lNd2wo=;
 b=DgqytdePWo/BIOZyGtga3yj5iFiyjwURCSgbAKBmi7xElSbpvnPpHEtzEUe2FjEVloBSU/
 HX08hOYxufsDwMgR9YGDmk1OwfHl+V/Css75jOz+ppFYBkk+cbWuUFPgl1bhZzFxtPjuOK
 /INFoezYsTE+eCffJ2sy88MSijsDb4s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-niYUkWNAPkiMJKcVI4UwNQ-1; Sun, 12 Jul 2020 17:06:33 -0400
X-MC-Unique: niYUkWNAPkiMJKcVI4UwNQ-1
Received: by mail-wr1-f72.google.com with SMTP id v3so15026970wrq.10
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Jul 2020 14:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L5r9lMKl+VedPwyqojqtAlh/T45L5HzUK3cN3lNd2wo=;
 b=ml2qvTqcuUjS3R/5IFPQnW1inK8JTsFxNczsASv1UV8akUu+fBmIQjU7I+4TM9f8uF
 xUyJPp6r5/AXRutwOkIlNSvMZHW8itlw4bv/zu4d63oW6WeZlo/baKP9pTi5l/b6qcAA
 hMgKScDa4/7LS7qYGDzfBCfbpICnVa4903FzJUxHbDm4G2I9Rby0RzoRYsc+wcoFpHKQ
 5wei9wllQ53ae/mV0WTNY/5u7m4JN6argTdheAW9oc/vdzIjEgdJ+Xgfr3DzMfLuMS3i
 Wq0q6tUN0ppUOkBz9jIvfbMbj4xrx57TTE0V9GK2UArWVDb348qWCf1QhYyb63Uu904x
 iP6Q==
X-Gm-Message-State: AOAM530Unky9qRSBOaLovryoGrWdwl6Jtpq+5CNsZUe9U/Iwa21NA3Qg
 KG4VUFJJIfpGnl5EiNs/qZeUoMJPcGqd0KEC6zG2scK07CkqNpK6uf2C+LismyN5VJQYit+qt5e
 9vjJJ/EVvRiT9MsOc3KuJIJft2c5j1+8JYEir2naJwg==
X-Received: by 2002:a5d:62d1:: with SMTP id o17mr74654335wrv.162.1594587992467; 
 Sun, 12 Jul 2020 14:06:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN9eeLixYJUNonj+ARv9bC7NvUuWCjy8yRp5ZiT/Iu14VpgMjjIlrxVEOv3G+xr1uFy1JA2w==
X-Received: by 2002:a5d:62d1:: with SMTP id o17mr74654324wrv.162.1594587992226; 
 Sun, 12 Jul 2020 14:06:32 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 w17sm20955259wra.42.2020.07.12.14.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 14:06:31 -0700 (PDT)
Date: Sun, 12 Jul 2020 17:06:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH 2/7] kvm/vfio: detect assigned device via irqbypass manager
Message-ID: <20200712170518-mutt-send-email-mst@kernel.org>
References: <1594565366-3195-1-git-send-email-lingshan.zhu@intel.com>
 <1594565366-3195-2-git-send-email-lingshan.zhu@intel.com>
MIME-Version: 1.0
In-Reply-To: <1594565366-3195-2-git-send-email-lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, netdev@vger.kernel.org,
 sean.j.christopherson@intel.com, virtualization@lists.linux-foundation.org,
 pbonzini@redhat.com, "./0000-cover-letter.patch"@redhat.com
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

On Sun, Jul 12, 2020 at 10:49:21PM +0800, Zhu Lingshan wrote:
> We used to detect assigned device via VFIO manipulated device
> conters. This is less flexible consider VFIO is not the only
> interface for assigned device. vDPA devices has dedicated
> backed hardware as well. So this patch tries to detect
> the assigned device via irqbypass manager.
> 
> We will increase/decrease the assigned device counter in kvm/x86.
> Both vDPA and VFIO would go through this code path.
> 
> This code path only affect x86 for now.
> 
> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>


I think it's best to leave VFIO alone. Add appropriate APIs for VDPA,
worry about converting existing users later.

> ---
>  arch/x86/kvm/x86.c | 10 ++++++++--
>  virt/kvm/vfio.c    |  2 --
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 00c88c2..20c07d3 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -10624,11 +10624,17 @@ int kvm_arch_irq_bypass_add_producer(struct irq_bypass_consumer *cons,
>  {
>  	struct kvm_kernel_irqfd *irqfd =
>  		container_of(cons, struct kvm_kernel_irqfd, consumer);
> +	int ret;
>  
>  	irqfd->producer = prod;
> +	kvm_arch_start_assignment(irqfd->kvm);
> +	ret = kvm_x86_ops.update_pi_irte(irqfd->kvm,
> +					 prod->irq, irqfd->gsi, 1);
> +
> +	if (ret)
> +		kvm_arch_end_assignment(irqfd->kvm);
>  
> -	return kvm_x86_ops.update_pi_irte(irqfd->kvm,
> -					   prod->irq, irqfd->gsi, 1);
> +	return ret;
>  }
>  
>  void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
> diff --git a/virt/kvm/vfio.c b/virt/kvm/vfio.c
> index 8fcbc50..111da52 100644
> --- a/virt/kvm/vfio.c
> +++ b/virt/kvm/vfio.c
> @@ -226,7 +226,6 @@ static int kvm_vfio_set_group(struct kvm_device *dev, long attr, u64 arg)
>  		list_add_tail(&kvg->node, &kv->group_list);
>  		kvg->vfio_group = vfio_group;
>  
> -		kvm_arch_start_assignment(dev->kvm);
>  
>  		mutex_unlock(&kv->lock);
>  
> @@ -254,7 +253,6 @@ static int kvm_vfio_set_group(struct kvm_device *dev, long attr, u64 arg)
>  				continue;
>  
>  			list_del(&kvg->node);
> -			kvm_arch_end_assignment(dev->kvm);
>  #ifdef CONFIG_SPAPR_TCE_IOMMU
>  			kvm_spapr_tce_release_vfio_group(dev->kvm,
>  							 kvg->vfio_group);
> -- 
> 1.8.3.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
