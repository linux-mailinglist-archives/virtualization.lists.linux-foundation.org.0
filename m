Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D82DC177982
	for <lists.virtualization@lfdr.de>; Tue,  3 Mar 2020 15:49:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8FB9785BC8;
	Tue,  3 Mar 2020 14:49:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qUONiQ5lhMlj; Tue,  3 Mar 2020 14:49:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1F14985A74;
	Tue,  3 Mar 2020 14:49:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 027AEC013E;
	Tue,  3 Mar 2020 14:49:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7225EC013E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 14:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6B93687360
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 14:49:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JqdjWKebXtBJ
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 14:49:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7018887263
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 14:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583246970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZAMz9trEBbggImBzI8TwjqrfBpm7beP6aWAuQ0+PcZA=;
 b=eE0+UcwgNrtQ7W4swxVaZv4ztdpWTyVWPVBnmdeiJ7GlDrVNl/+Y4gEbyeY17hHw7dEGaj
 IU2fDDhCVmsALWZckBJM1xk0HAo+pCZ4wMl6LgCyNBe+bfy9TKsMYijvh99zaE0g1YMR2S
 voRk1KCNCy93zIz2wHiOnLud+hvcEgE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-XPoy1jzrO061A-U3jZ84tw-1; Tue, 03 Mar 2020 09:49:27 -0500
X-MC-Unique: XPoy1jzrO061A-U3jZ84tw-1
Received: by mail-qv1-f71.google.com with SMTP id s5so2188807qvr.15
 for <virtualization@lists.linux-foundation.org>;
 Tue, 03 Mar 2020 06:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZAMz9trEBbggImBzI8TwjqrfBpm7beP6aWAuQ0+PcZA=;
 b=LqN7j+dLMVpvYCSHMGq0Ejjd8wZwj86O3xGs6okWQQjprv+t/tImh7I93YDCjBabq0
 icC89zOh0IM/dmSyQTLAEBmkV2eh75n3KNsbrg//q8uJsr6919PgtgTTgDi6lNdQCDAg
 vvVOEr7GMq75xzBpbPK6KxtW+PIlAS25wMx1yaLrUObpIMNt3rAsIqpOztvavVVQiFjM
 tU9OBgJVY5i70S8UHyGCR7nl3IA53hWwziULh2xSrJY6oHE5jcbRe6glUHc2HV9fSXTd
 C2+/VWN9fr3Nf4YOPvKKJiW9tBK0ZzF9XgpkGLCDXLUzYfsHwLOy9WkL8LQPwrkfxpdB
 leSw==
X-Gm-Message-State: ANhLgQ2jkNkAfMBBb/rXO0q8KLpMtCY8ZclwblcAWxmTnYhh0SViZfqw
 fxARZPm9xmE6FAakkOQqOEk7xxhkxcUz+L1SGYEIH8IylN7mKsFwNTAEIx7Q+IRiv76QyAWLP7W
 ICVfbuj8RAWlzsbmdJT3TSDtSpQOvLuNUndcbLLYXyA==
X-Received: by 2002:a0c:f692:: with SMTP id p18mr4372498qvn.61.1583246967038; 
 Tue, 03 Mar 2020 06:49:27 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsyjBrEg2YMLlS4Ny5GGY4zKEspwxCc/KeO/4ULBZu3vu5BQGOxB/vGW3jXL4KM69SWf9Bpkw==
X-Received: by 2002:a0c:f692:: with SMTP id p18mr4372474qvn.61.1583246966856; 
 Tue, 03 Mar 2020 06:49:26 -0800 (PST)
Received: from redhat.com (bzq-79-180-48-224.red.bezeqint.net. [79.180.48.224])
 by smtp.gmail.com with ESMTPSA id g8sm3079010qke.1.2020.03.03.06.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 06:49:26 -0800 (PST)
Date: Tue, 3 Mar 2020 09:49:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 0/2] virtio-blk: improve handling of DMA mapping failures
Message-ID: <20200303094909-mutt-send-email-mst@kernel.org>
References: <20200213123728.61216-1-pasic@linux.ibm.com>
 <20200303151252.59d45e86.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20200303151252.59d45e86.pasic@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jens Axboe <axboe@kernel.dk>, linux-s390@vger.kernel.org, "Lendacky,
 Thomas" <Thomas.Lendacky@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>
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

On Tue, Mar 03, 2020 at 03:12:52PM +0100, Halil Pasic wrote:
> On Thu, 13 Feb 2020 13:37:26 +0100
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > Two patches are handling new edge cases introduced by doing DMA mappings
> > (which can fail) in virtio core.
> > 
> > I stumbled upon this while stress testing I/O for Protected Virtual
> > Machines. I deliberately chose a tiny swiotlb size and have generated
> > load with fio. With more than one virtio-blk disk in use I experienced
> > hangs.
> > 
> > The goal of this series is to fix those hangs.
> > 
> > Halil Pasic (2):
> >   virtio-blk: fix hw_queue stopped on arbitrary error
> >   virtio-blk: improve virtqueue error to BLK_STS
> > 
> >  drivers/block/virtio_blk.c | 17 ++++++++++++-----
> >  1 file changed, 12 insertions(+), 5 deletions(-)
> > 
> > 
> > base-commit: 39bed42de2e7d74686a2d5a45638d6a5d7e7d473
> 
> ping
> 
> Hi Michael, hi Jason,
> 
> I got some favorable reviews for this, but AFAIK I got nothing form the
> maintainers yet.
> 
> Is some of you going to pick these?
> 
> Regards,
> Halil

I've queued this, thanks!

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
