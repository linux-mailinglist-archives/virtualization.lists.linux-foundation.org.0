Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 73087196D48
	for <lists.virtualization@lfdr.de>; Sun, 29 Mar 2020 14:25:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F2678875BF;
	Sun, 29 Mar 2020 12:25:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8tKFZI6GiFNs; Sun, 29 Mar 2020 12:25:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 052F286DE2;
	Sun, 29 Mar 2020 12:25:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6E69C07FF;
	Sun, 29 Mar 2020 12:25:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92681C07FF
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Mar 2020 12:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7972886D16
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Mar 2020 12:25:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XxaQQ69BP5iq
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Mar 2020 12:25:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5CD4486CF9
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Mar 2020 12:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585484712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7aYQvfE9ZI6p73CzOSPy+6jJYmr2roJlefLeW6BGFEU=;
 b=audLTlvkN/cqG3duALmJJMP6xDmaM84YXLiWiteLA1VIrIN/86fopvl3aOWY/XHdYwMTml
 tEMrvGTrkQ/TbTRpoz+LD2igaaz8YzDO7zp25gTH8j38QLUOr59F9623ZlCfbElH7dJbEZ
 QapcclV/Zgt0tDLKMbZCJwYoNF3XYNE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-QTvOqIcfNnGzrafFuRprKw-1; Sun, 29 Mar 2020 08:25:10 -0400
X-MC-Unique: QTvOqIcfNnGzrafFuRprKw-1
Received: by mail-wr1-f71.google.com with SMTP id h95so3200017wrh.11
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Mar 2020 05:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7vKFOd347o9WoHxHI6B5j1Zjim146jeGZmfmqH7fBaE=;
 b=WjfDcD/vbnXiQGXOSopVQsQwJyMkEwIZj+VdTnd3npGoTnLuJLJqr90uVGKljiBnU+
 AWN9IKZaCN8BNjJqxidJUt/IjAJn0b0zSQ2zn0wUvpkRiE2CpfRay/V+UA6Broy1R89n
 mQ8TlXi4AQ9W2IRYXBdgrMs5pu7AxbOCi46dVY9jgXRZoP7xJaFP4K/wf6ji7wuJ/KSS
 LNLOa4QOec2lIKsLReCvnSbB8jncOUtta78snmyArHwc6kKVO9pK8IBnU2My6J83OpB5
 meTbwSolUgqmdxepHjaafh1uEMZYSiZ/+DC1iu2FSy+ozwsmzvPtZPlaWnPHmOQnuNCq
 2mSQ==
X-Gm-Message-State: ANhLgQ0stffXvLLtZ5SGaCtJNdKs89i7xvU/CjcM+iHizwrgP/Q1e237
 KZWGh1yeXqfH5tExaf+I9lfMrSVuNlzAztiBZjIMjaYBuwDCYL3cBjzufGw3jRyOeJ62RMA53Q6
 tL7eoC0OyOoc6SSmSthQleTwmo/olL5ixHTyLQ04l9g==
X-Received: by 2002:adf:e942:: with SMTP id m2mr9560597wrn.364.1585484709181; 
 Sun, 29 Mar 2020 05:25:09 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuHbrAQAMGspN3vkSyUCV4rlxQ2qSDmnNPRnKfein9CsAMF+8qjUPe34LCmI1NXow9ZnUY3qA==
X-Received: by 2002:adf:e942:: with SMTP id m2mr9560582wrn.364.1585484708917; 
 Sun, 29 Mar 2020 05:25:08 -0700 (PDT)
Received: from redhat.com (bzq-79-183-139-129.red.bezeqint.net.
 [79.183.139.129])
 by smtp.gmail.com with ESMTPSA id z129sm16715180wmb.7.2020.03.29.05.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 05:25:08 -0700 (PDT)
Date: Sun, 29 Mar 2020 08:25:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH 0/6] vhost: Reset batched descriptors on SET_VRING_BASE
 call
Message-ID: <20200329082055-mutt-send-email-mst@kernel.org>
References: <20200329113359.30960-1-eperezma@redhat.com>
 <20200329074023-mutt-send-email-mst@kernel.org>
 <CAJaqyWdO8CHuWFJv+TRgYJ7a3Cb06Ln3prnQZs69L1PPw4Rj1Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWdO8CHuWFJv+TRgYJ7a3Cb06Ln3prnQZs69L1PPw4Rj1Q@mail.gmail.com>
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

On Sun, Mar 29, 2020 at 02:19:55PM +0200, Eugenio Perez Martin wrote:
> On Sun, Mar 29, 2020 at 1:49 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Sun, Mar 29, 2020 at 01:33:53PM +0200, Eugenio P=C3=A9rez wrote:
> > > Vhost did not reset properly the batched descriptors on SET_VRING_BAS=
E event. Because of that, is possible to return an invalid descriptor to th=
e guest.
> > > This series ammend this, and creates a test to assert correct behavio=
r. To do that, they need to expose a new function in virtio_ring, virtqueue=
_reset_free_head. Not sure if this can be avoided.
> >
> > Question: why not reset the batch when private_data changes?
> > At the moment both net and scsi poke at private data directly,
> > if they do this through a wrapper we can use that to
> > 1. check that vq mutex is taken properly
> > 2. reset batching
> >
> > This seems like a slightly better API
> >
> =

> I didn't do that way because qemu could just SET_BACKEND to -1 and
> SET_BACKEND to the same one, with no call to SET_VRING. In this case,
> I think that qemu should not change the descriptors already pushed.

Well dropping the batch is always safe, batch is an optimization.


> I
> do agree with the interface to modify private_data properly (regarding
> the mutex).
> =

> However, I can see how your proposal is safer, so we don't even need
> to check if private_data is !=3D NULL when we have descriptors in the
> batch_descs array. Also, this ioctls should not be in the hot path, so
> we can change to that mode anyway.
> =

> > >
> > > Also, change from https://lkml.org/lkml/2020/3/27/108 is not included=
, that avoids to update a variable in a loop where it can be updated once.
> > >
> > > This is meant to be applied on top of eccb852f1fe6bede630e2e4f1a121a8=
1e34354ab in git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git, and som=
e commits should be squashed with that series.
> >
> > Thanks a lot! I'll apply this for now so Christian can start testing,
> > but I'd like the comment above addressed before I push this to Linus.
> >
> > > Eugenio P=C3=A9rez (6):
> > >   tools/virtio: Add --batch option
> > >   tools/virtio: Add --batch=3Drandom option
> > >   tools/virtio: Add --reset=3Drandom
> > >   tools/virtio: Make --reset reset ring idx
> > >   vhost: Delete virtqueue batch_descs member
> > >   fixup! vhost: batching fetches
> > >
> > >  drivers/vhost/test.c         |  57 ++++++++++++++++
> > >  drivers/vhost/test.h         |   1 +
> > >  drivers/vhost/vhost.c        |  12 +++-
> > >  drivers/vhost/vhost.h        |   1 -
> > >  drivers/virtio/virtio_ring.c |  18 +++++
> > >  include/linux/virtio.h       |   2 +
> > >  tools/virtio/linux/virtio.h  |   2 +
> > >  tools/virtio/virtio_test.c   | 123 +++++++++++++++++++++++++++++++--=
--
> > >  8 files changed, 201 insertions(+), 15 deletions(-)
> > >
> > > --
> > > 2.18.1
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
