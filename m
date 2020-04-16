Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB371AD2E0
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 00:34:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5447387F5D;
	Thu, 16 Apr 2020 22:34:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pqb6qIkGoyas; Thu, 16 Apr 2020 22:34:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A439587F48;
	Thu, 16 Apr 2020 22:34:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E2A4C0172;
	Thu, 16 Apr 2020 22:34:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F093EC0172
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 22:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EB00284607
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 22:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jBky0ETDwf9o
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 22:34:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DF792842F6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 22:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587076445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ftnc6BB4GPGGpBWNYOB79twLTTZZ8cM0GxWVy9GO1n4=;
 b=Wsf+w3qBWKtiaj8dvRsgKtwzlEP5g3Zelqz0IrqPir1KeEBeL8JCdrQ6czbgU0EkjNnXkl
 Me5S/SCc1ouILyQPx7WKbweCcqL11QcpITjVjBP8Et7Np1m/6jGb/o6G//eAMBfrBoGBEq
 LxDNWrRdWXOuFo1caeu6Ql7LKvBCGE4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-hDI93uQLNXSq-Dkw3hir8Q-1; Thu, 16 Apr 2020 18:34:03 -0400
X-MC-Unique: hDI93uQLNXSq-Dkw3hir8Q-1
Received: by mail-wr1-f70.google.com with SMTP id f15so5461wrj.2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 15:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=A1bma2gluq3HGOu3CaCHez8AlHNyzwOb99nKMYoTBrs=;
 b=Bs2oqvuseAed5W30Pxg9pQdVXL5bNbEn1e0dmMDVbrhUr4+dhz8O4vySZvUpFvVszr
 Z4ShcpYHUQZfFPJg+jgyNoB0C+lZqIt7z/+XzxlncHH5+ibxD4p5QDHHWfeMs6M9nVCk
 onAjkE84zhAK++lcqIKWSK8NyakkVpAlA30Wy53cOZxvq4FKvG5m3Wo+F3Czs+vnBgjQ
 FK7flAvwzKEZyCh7oTY+4rm2DCV4yaEwU3nYC4nXHSYW1ok1Q5ZYV7NjHfLnaWb3IkiR
 XPVjOXYCrfG38BxdnlKysnG3TuDMUZVjUu56CrErowDNIyHffTWnRhaGSjg/t23fjkYM
 EAKg==
X-Gm-Message-State: AGi0PuarY/W9nCtIOZXByCKADszjy/lUpYQiCzxUslPRuJ+OQpbws0q5
 huptPFQ8Mhj7id3bR5k/mKR8nUNZ1iNSDEI6OOX0WCFFFRrvP55PZC8aeVut6+kTO3lrkpXV6td
 wFaSaGwA4EArCQOrdUIAISJGI6OnmaUWKZAzl/F5KjQ==
X-Received: by 2002:a1c:4346:: with SMTP id q67mr98424wma.162.1587076442804;
 Thu, 16 Apr 2020 15:34:02 -0700 (PDT)
X-Google-Smtp-Source: APiQypKXN83gnjbKOoJt6yPtsWQIwZwD4bOGlfUuqfOI5ajKzWnkQM8hnZuZwWeeXGxrvKUUk0sKdg==
X-Received: by 2002:a1c:4346:: with SMTP id q67mr98410wma.162.1587076442597;
 Thu, 16 Apr 2020 15:34:02 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id m15sm5010453wmc.35.2020.04.16.15.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 15:34:02 -0700 (PDT)
Date: Thu, 16 Apr 2020 18:33:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH v2 7/8] tools/virtio: Reset index in virtio_test --reset.
Message-ID: <20200416183324-mutt-send-email-mst@kernel.org>
References: <20200416075643.27330-1-eperezma@redhat.com>
 <20200416075643.27330-8-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200416075643.27330-8-eperezma@redhat.com>
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

On Thu, Apr 16, 2020 at 09:56:42AM +0200, Eugenio P=C3=A9rez wrote:
> This way behavior for vhost is more like a VM.
> =

> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

I dropped --reset from 5.7 since Linus felt it's unappropriate.
I guess I should squash this in with --reset?

> ---
>  tools/virtio/virtio_test.c | 33 ++++++++++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 7 deletions(-)
> =

> diff --git a/tools/virtio/virtio_test.c b/tools/virtio/virtio_test.c
> index 18d5347003eb..dca64d36a882 100644
> --- a/tools/virtio/virtio_test.c
> +++ b/tools/virtio/virtio_test.c
> @@ -20,7 +20,6 @@
>  #include "../../drivers/vhost/test.h"
>  =

>  #define RANDOM_BATCH -1
> -#define RANDOM_RESET -1
>  =

>  /* Unused */
>  void *__kmalloc_fake, *__kfree_ignore_start, *__kfree_ignore_end;
> @@ -49,6 +48,7 @@ struct vdev_info {
>  =

>  static const struct vhost_vring_file no_backend =3D { .fd =3D -1 },
>  				     backend =3D { .fd =3D 1 };
> +static const struct vhost_vring_state null_state =3D {};
>  =

>  bool vq_notify(struct virtqueue *vq)
>  {
> @@ -174,14 +174,19 @@ static void run_test(struct vdev_info *dev, struct =
vq_info *vq,
>  	unsigned len;
>  	long long spurious =3D 0;
>  	const bool random_batch =3D batch =3D=3D RANDOM_BATCH;
> +
>  	r =3D ioctl(dev->control, VHOST_TEST_RUN, &test);
>  	assert(r >=3D 0);
> +	if (!reset_n) {
> +		next_reset =3D INT_MAX;
> +	}
> +
>  	for (;;) {
>  		virtqueue_disable_cb(vq->vq);
>  		completed_before =3D completed;
>  		started_before =3D started;
>  		do {
> -			const bool reset =3D reset_n && completed > next_reset;
> +			const bool reset =3D completed > next_reset;
>  			if (random_batch)
>  				batch =3D (random() % vq->vring.num) + 1;
>  =

> @@ -224,10 +229,24 @@ static void run_test(struct vdev_info *dev, struct =
vq_info *vq,
>  			}
>  =

>  			if (reset) {
> +				struct vhost_vring_state s =3D { .index =3D 0 };
> +
> +				vq_reset(vq, vq->vring.num, &dev->vdev);
> +
> +				r =3D ioctl(dev->control, VHOST_GET_VRING_BASE,
> +					  &s);
> +				assert(!r);
> +
> +				s.num =3D 0;
> +				r =3D ioctl(dev->control, VHOST_SET_VRING_BASE,
> +					  &null_state);
> +				assert(!r);
> +
>  				r =3D ioctl(dev->control, VHOST_TEST_SET_BACKEND,
>  					  &backend);
>  				assert(!r);
>  =

> +				started =3D completed;
>  				while (completed > next_reset)
>  					next_reset +=3D completed;
>  			}
> @@ -249,7 +268,9 @@ static void run_test(struct vdev_info *dev, struct vq=
_info *vq,
>  	test =3D 0;
>  	r =3D ioctl(dev->control, VHOST_TEST_RUN, &test);
>  	assert(r >=3D 0);
> -	fprintf(stderr, "spurious wakeups: 0x%llx\n", spurious);
> +	fprintf(stderr,
> +		"spurious wakeups: 0x%llx started=3D0x%lx completed=3D0x%lx\n",
> +		spurious, started, completed);
>  }
>  =

>  const char optstring[] =3D "h";
> @@ -312,7 +333,7 @@ static void help(void)
>  		" [--no-virtio-1]"
>  		" [--delayed-interrupt]"
>  		" [--batch=3Drandom/N]"
> -		" [--reset=3Drandom/N]"
> +		" [--reset=3DN]"
>  		"\n");
>  }
>  =

> @@ -360,11 +381,9 @@ int main(int argc, char **argv)
>  		case 'r':
>  			if (!optarg) {
>  				reset =3D 1;
> -			} else if (0 =3D=3D strcmp(optarg, "random")) {
> -				reset =3D RANDOM_RESET;
>  			} else {
>  				reset =3D strtol(optarg, NULL, 10);
> -				assert(reset >=3D 0);
> +				assert(reset > 0);
>  				assert(reset < (long)INT_MAX + 1);
>  			}
>  			break;
> -- =

> 2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
