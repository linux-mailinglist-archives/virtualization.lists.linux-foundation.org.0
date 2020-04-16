Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 111641AD2D3
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 00:33:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1CC1C2051A;
	Thu, 16 Apr 2020 22:33:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sygu5bf193dI; Thu, 16 Apr 2020 22:33:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3BA4220134;
	Thu, 16 Apr 2020 22:33:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1861CC0172;
	Thu, 16 Apr 2020 22:33:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C192C0172
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 22:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6F97387263
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 22:33:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tyZMdEVht0vG
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 22:33:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 402DB872A6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 22:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587076383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PDxZrctoNKtVPP7pJWNBAGq+ftv2lDl5c8qsUpQCnGA=;
 b=U53CoZURcSTvCO/jRjniT1PGiMgXfXWk2wCuz7YC72yW780/by3Pc+UUqeInjA/DyTy06k
 uycU9R+QUZ51cHwvzhSaRdjQNeDVhTu48CQVQBRbQL8w92DXMc0Frw8T27nQf1QiSabgQD
 jK5SuUzjoP84/3+GcDBhvvQsQKBOU6E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-48VdOQIEPSieeQCJ8ObBJQ-1; Thu, 16 Apr 2020 18:33:01 -0400
X-MC-Unique: 48VdOQIEPSieeQCJ8ObBJQ-1
Received: by mail-wm1-f69.google.com with SMTP id h22so134319wml.1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 15:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qUf9DXimPD8UBiVLdfnQM98oUkmHdl6eiPE6mf0vIko=;
 b=o59fJRhww2w3MQNxHmHKxisl3YnK5nEdOiAFIrRMbGb3HQYeSkS7tRLvjYleb7dkU6
 H43Dm4z/bkwfLTh1r6lgPcswAKo73w8EmbGjaNcLccVFYSF5NRnOvjtX5mNX9GXfqo+b
 F/wRVdgXdoHLfwLvgW0qzUO1ZQhPDtMqGJWikwDYuPv3AHuczchQov07E4/k52DTQoR/
 VbvF+kF4VmkW2J4tH2ZB59WHGrYJS1lHv5RfdfRx1vR8ehgE5LwZ7yj30C2IUr5Yv31v
 CogkKWgIxNS1ygl9HDp9t2vrKKMMPlYA8S7y+7kpTvNtmh6lQc2D0P+KhwbF9l7kC+hE
 8DIA==
X-Gm-Message-State: AGi0PuY5FkSrmT8raFw8lCLJmEtPGYcGs4Esgy6LiN3uubSpF2SxYUyl
 lbZOyrENr6sGbm9IMt5V46tZHkGHnEtnvaWfTp2ZBoGZttWPYQQj3xM0wRKbrqqmw/a7VuLexzS
 Mjbx2/Iux/F9IqAEKyLu41wcnJ5RXBebDlHYTpofhzQ==
X-Received: by 2002:a7b:ce81:: with SMTP id q1mr106313wmj.156.1587076380275;
 Thu, 16 Apr 2020 15:33:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypIy+rWP6GLwQOV39yuKvCoJ5WM3R60eHJj8M3PsMQSHsFk9lyxG27YOo0I93W1RyqT/v7nwTQ==
X-Received: by 2002:a7b:ce81:: with SMTP id q1mr106300wmj.156.1587076380092;
 Thu, 16 Apr 2020 15:33:00 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id h137sm6135220wme.0.2020.04.16.15.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 15:32:59 -0700 (PDT)
Date: Thu, 16 Apr 2020 18:32:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH v2 5/8] tools/virtio: Use __vring_new_virtqueue in
 virtio_test.c
Message-ID: <20200416183244-mutt-send-email-mst@kernel.org>
References: <20200416075643.27330-1-eperezma@redhat.com>
 <20200416075643.27330-6-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200416075643.27330-6-eperezma@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm list <kvm@vger.kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu, Apr 16, 2020 at 09:56:40AM +0200, Eugenio P=C3=A9rez wrote:
> As updated in ("2a2d1382fe9d virtio: Add improved queue allocation API")
> =

> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Pls add motivation for these changes.

> ---
>  tools/virtio/virtio_test.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> =

> diff --git a/tools/virtio/virtio_test.c b/tools/virtio/virtio_test.c
> index 1d5144590df6..d9827b640c21 100644
> --- a/tools/virtio/virtio_test.c
> +++ b/tools/virtio/virtio_test.c
> @@ -106,10 +106,9 @@ static void vq_info_add(struct vdev_info *dev, int n=
um)
>  	assert(r >=3D 0);
>  	memset(info->ring, 0, vring_legacy_size(num, 4096));
>  	vring_legacy_init(&info->vring, num, info->ring, 4096);
> -	info->vq =3D vring_new_virtqueue(info->idx,
> -				       info->vring.num, 4096, &dev->vdev,
> -				       true, false, info->ring,
> -				       vq_notify, vq_callback, "test");
> +	info->vq =3D
> +		__vring_new_virtqueue(info->idx, info->vring, &dev->vdev, true,
> +				      false, vq_notify, vq_callback, "test");
>  	assert(info->vq);
>  	info->vq->priv =3D info;
>  	vhost_vq_setup(dev, info);
> -- =

> 2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
