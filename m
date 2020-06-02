Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CD71EB4D8
	for <lists.virtualization@lfdr.de>; Tue,  2 Jun 2020 07:02:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A550285D94;
	Tue,  2 Jun 2020 05:02:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xp3c-8vcV6O7; Tue,  2 Jun 2020 05:02:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4701B85EB4;
	Tue,  2 Jun 2020 05:02:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F306C0176;
	Tue,  2 Jun 2020 05:02:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C151C0176
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 05:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 56B1B85EB4
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 05:02:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z1z4CyjE8UjL
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 05:02:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D1CE885D94
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 05:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591074128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=unNhbaKpoHgJDBrC7Eb3u/ZNlGD55wlBW/mLz0bPcnk=;
 b=Jl0OWvei2I2/20rFmmvH5/WTo3p4W7Ci1LtJSJ9nuDjhlZXPjWOUYOBQXfPZnj+fRrTLf4
 bucKAOoFgJlfeZB4XIT8+5/rm3Nbw0ZtJyG8iZVsaChChrbCM9jcTlOiaqNp9Fi7IT95xV
 kg1A9PlRk0h/JuxKkfX1OnQthEXmy3s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-vlSKEjuwNoery0WNvbz67Q-1; Tue, 02 Jun 2020 01:02:02 -0400
X-MC-Unique: vlSKEjuwNoery0WNvbz67Q-1
Received: by mail-wr1-f72.google.com with SMTP id l1so876985wrc.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 01 Jun 2020 22:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=unNhbaKpoHgJDBrC7Eb3u/ZNlGD55wlBW/mLz0bPcnk=;
 b=MFJ0FfYBIQP3HPkcKIsyiyF6KxQ0EeChfqke/ONHOasM9oy4q+fbs0obHJia4VhR0U
 X2jFbjqxIppQiimSmwotT6Z/ohK9AaNxdfcRKNIPgTxxdFOFnSrJcDJXVpmWOpC6UPub
 mqbMWid3Wq5IUifiA+rQ6bKWbN4uImanxWM2wzQkLsEh9vRbxyKifll+q6olANZkEBdX
 3s/kZUqmg2jhAEjTbIBB8ssTwOLbEfi1h75Z5chzRBx8sgfdL6ULvXTnVGk69d6JYBDy
 TYaSuJL5AcO466+amIbE0X1whkKU0BS8o5rokoWr7bjaKb5Lpz3+PjBhVu8Q7AnWHAgX
 29qw==
X-Gm-Message-State: AOAM5316RNu69P/k/1DL4HYjJszZaK+ftgTyc3wlExwXtwAhOuNQGbKO
 BSo97EvuA8JNloD4oYe9NG+ZM8J2CG0BInbQ4FSOoQDXf4S7v2BcWUvanNOM5PGLCzbfkiTWsHt
 Zhutce4LG1LVMPB8UhOzO7gGz14l71CBweN2O97uajA==
X-Received: by 2002:adf:9b9e:: with SMTP id d30mr25308459wrc.345.1591074121705; 
 Mon, 01 Jun 2020 22:02:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3nr1AXCn3Z5SMmVoLwH2lrM47voNMRhlWpVupnJ+5ZSE/pBwVxy8G2I2bBBJ+b49EcSyp0Q==
X-Received: by 2002:adf:9b9e:: with SMTP id d30mr25308453wrc.345.1591074121511; 
 Mon, 01 Jun 2020 22:02:01 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 w3sm1759935wmg.44.2020.06.01.22.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 22:02:00 -0700 (PDT)
Date: Tue, 2 Jun 2020 01:01:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 1/6] vhost: allow device that does not depend on vhost
 worker
Message-ID: <20200602005904-mutt-send-email-mst@kernel.org>
References: <20200529080303.15449-1-jasowang@redhat.com>
 <20200529080303.15449-2-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200529080303.15449-2-jasowang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: shahafs@mellanox.com, lulu@redhat.com, kvm@vger.kernel.org,
 saugatm@xilinx.com, netdev@vger.kernel.org, mhabets@solarflare.com,
 vmireyno@marvell.com, linux-kernel@vger.kernel.org, gdawar@xilinx.com,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, zhangweining@ruijie.com.cn, eli@mellanox.com,
 lingshan.zhu@intel.com, rob.miller@broadcom.com
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

On Fri, May 29, 2020 at 04:02:58PM +0800, Jason Wang wrote:
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index d450e16c5c25..70105e045768 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -166,11 +166,16 @@ static int vhost_poll_wakeup(wait_queue_entry_t *wait, unsigned mode, int sync,
>  			     void *key)
>  {
>  	struct vhost_poll *poll = container_of(wait, struct vhost_poll, wait);
> +	struct vhost_work *work = &poll->work;
>  
>  	if (!(key_to_poll(key) & poll->mask))
>  		return 0;
>  
> -	vhost_poll_queue(poll);
> +	if (!poll->dev->use_worker)
> +		work->fn(work);
> +	else
> +		vhost_poll_queue(poll);
> +
>  	return 0;
>  }
>

So a wakeup function wakes up eventfd directly.

What if user supplies e.g. the same eventfd as ioeventfd?

Won't this cause infinite loops?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
