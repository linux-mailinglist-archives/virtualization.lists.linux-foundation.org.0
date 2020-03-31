Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A31EE19980E
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 16:03:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4DD858680D;
	Tue, 31 Mar 2020 14:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ymb3Ngt-4b4w; Tue, 31 Mar 2020 14:03:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8421B8669F;
	Tue, 31 Mar 2020 14:03:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60437C07FF;
	Tue, 31 Mar 2020 14:03:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC9C3C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B6F6486D37
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TB76CjpHL5md
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:03:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2AA9086D2A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585663410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q1HhUZIT2eXWaur2lhwyirTrp2FNrCuPmxOJW0kwlcg=;
 b=HpkWPKW2oN374GKMVB/CClXB0sIvJqeXOwOtCyoGB9qW89FHFnUnHhm/wN+B8B5wIl0qyE
 PiDKFedsctpuuYvSWf9GEcwLYmtZ4tWLb1FvrvgqjkUjsVYHxDcBDCpXdMTMnAYIw8ZItI
 VcM/05XfM0u3bHciDBb8l8vD+TpW5Kw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-ak0z06_fNXGEBHWlqATgBA-1; Tue, 31 Mar 2020 10:03:29 -0400
X-MC-Unique: ak0z06_fNXGEBHWlqATgBA-1
Received: by mail-wr1-f72.google.com with SMTP id c8so11134787wru.20
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 07:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q1HhUZIT2eXWaur2lhwyirTrp2FNrCuPmxOJW0kwlcg=;
 b=na/XofKgs17uiI6/GsZaOwf2ujbtJkaK/Qjcw/PSzkRLZUz9iKvawB9n5lwN/WtU6c
 7u7M7Kff19gZbkmvI7vOwOpY6aPxtFEVY3pMNaoaecsZi99qCAvdzXKzcDhZGu3nOe+a
 ywWtQQBrdhLaVyWMG2nUT0tCVK0Ei5L7eqtqYOKnMdP02uxfop/oFvIs0jCgnwF4UdGk
 Sm2zQbqoFEbNb1GZxy/ZXBIZ35BaP1v2YF/jlxwdxIVnwvcCB7t5udpjAjMG6vBi0oT1
 bhDYPEzzF5mG3qGizN57JxRTLmmBENj6NJpYyIKdhySxnYWhz+xDwBLATbj+xec5TbVO
 6GHg==
X-Gm-Message-State: ANhLgQ3E1nrUxLJmBLX9+5jKr3GrHgZ8XMiuAndjNbLQTcFVZ5sDfvde
 O+TQYP9sYruHs9GLePohgiVe2o5YS7WDJgxCcKuhEpBzaqPNR3AKoSkP9veod5nUkWhgOt8sXmM
 96iczQBU1cwTSmgP+VHJrqhoAc3giMdnefktBbxt5LQ==
X-Received: by 2002:a1c:2203:: with SMTP id i3mr3685827wmi.25.1585663408034;
 Tue, 31 Mar 2020 07:03:28 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vulRkkpxXMxZEng5aERNo4jJ/g5cD0Vhw5jYc5ZRlaSa1jWBjmSh3+3XcGa4A4n7qFMJ8cR0g==
X-Received: by 2002:a1c:2203:: with SMTP id i3mr3685803wmi.25.1585663407800;
 Tue, 31 Mar 2020 07:03:27 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id r17sm26682436wrx.46.2020.03.31.07.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 07:03:20 -0700 (PDT)
Date: Tue, 31 Mar 2020 10:03:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] vhost: vdpa: remove unnecessary null check
Message-ID: <20200331100122-mutt-send-email-mst@kernel.org>
References: <20200330235040.GA9997@embeddedor>
MIME-Version: 1.0
In-Reply-To: <20200330235040.GA9997@embeddedor>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
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

On Mon, Mar 30, 2020 at 06:50:40PM -0500, Gustavo A. R. Silva wrote:
> container_of is never null, so this null check is
> unnecessary.
> 
> Addresses-Coverity-ID: 1492006 ("Logically dead code")
> Fixes: 20453a45fb06 ("vhost: introduce vDPA-based backend")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Yes weird. Was the point to test i_cdev? Tiwei?

> ---
>  drivers/vhost/vdpa.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index 421f02a8530a..3d2cb811757a 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -678,8 +678,6 @@ static int vhost_vdpa_open(struct inode *inode, struct file *filep)
>  	int nvqs, i, r, opened;
>  
>  	v = container_of(inode->i_cdev, struct vhost_vdpa, cdev);
> -	if (!v)
> -		return -ENODEV;
>  
>  	opened = atomic_cmpxchg(&v->opened, 0, 1);
>  	if (opened)
> -- 
> 2.26.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
