Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3AA22AD63
	for <lists.virtualization@lfdr.de>; Thu, 23 Jul 2020 13:15:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DDA3E89AE6;
	Thu, 23 Jul 2020 11:15:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CujGsGc+FXub; Thu, 23 Jul 2020 11:15:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 53FEB89AE4;
	Thu, 23 Jul 2020 11:15:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27E2AC004C;
	Thu, 23 Jul 2020 11:15:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F20E2C004C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 11:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D4DDF2C342
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 11:15:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZCucmt3M-s6u
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 11:15:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 7817229170
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 11:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595502922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kj91Fn/Ni4TaxzkjEUzQHX/cNEGsjQKqcz1OppnjkOI=;
 b=iBBeq+SSfXNNAW0/OmO+SShE/BNuTSnW3PrknskSgvORLtEH2nw7rEFTKgOGuRSaery3vq
 f7sK35wgp3tI1AjaycxdWbKUuvuSEVw5U5dPSh3CQnncqhwtZjuEIKp0VmmSaIUuKb99Eq
 G8uNIf8WoN5Vj7Z/BqjoE5QisK2Ju3A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-gC6WF2yPOESpj2uYySXr6g-1; Thu, 23 Jul 2020 07:15:20 -0400
X-MC-Unique: gC6WF2yPOESpj2uYySXr6g-1
Received: by mail-wm1-f71.google.com with SMTP id s2so462657wmj.7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 04:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Kj91Fn/Ni4TaxzkjEUzQHX/cNEGsjQKqcz1OppnjkOI=;
 b=mBSXX+Vb5xDR0gQmOP/J5Ixb5GmmYcxZDdzoAON3rMJk29epPiFxH/hNb4j1HFjDjc
 vKtD/Co43vslMC/t4kF4LRbc+oLhz1digJ258dSu7vuvmVdfs9gh/6dNC/XG4jaZ6h3v
 2a/u09oqIowdnOva2Ow49M0kHd+DBZU35rma1T5FG7HZAVQaOWJ5cUTVvh83U+0JsnsE
 VTIgh1kh7fzEUcLzMAG0Sn9WJhC7VSsdlTZcy75oqMgSeF/C2XWkN8JgFHDmVY3VOTP7
 RsXK1/S24i7qN5l4yS9rqucOSKGmNIH5dq/xlCekeEdp137ZYgg5XFe8XTxyZ8JsaAC4
 wPDw==
X-Gm-Message-State: AOAM533n6zvm78Z7tX/XulwzZHDIbSxM8mqbz1zTntykAhwusVh5BSI+
 iFexdX/2BSVwYP/FBXf89B+TaQF9BBluIdai6H728G0HTfVfujnxtVkpL4klWI1KOngEeLWPY6d
 OUtV8p95CbSjLbWaG7nVZh880iAzTSpv1pfVyC976Ww==
X-Received: by 2002:a7b:cd07:: with SMTP id f7mr3507421wmj.115.1595502919767; 
 Thu, 23 Jul 2020 04:15:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIYJ3c0yCPo0rkDeJz+2/TFHr+bmAx3lBYj86VQMefb1Mx8jDbDkEXyF60RQpcZvwWPPKn/A==
X-Received: by 2002:a7b:cd07:: with SMTP id f7mr3507406wmj.115.1595502919494; 
 Thu, 23 Jul 2020 04:15:19 -0700 (PDT)
Received: from steredhat.lan ([5.180.207.22])
 by smtp.gmail.com with ESMTPSA id n5sm3170331wmi.34.2020.07.23.04.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 04:15:18 -0700 (PDT)
Date: Thu, 23 Jul 2020 13:15:14 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: Interesting qemu/virt-manager bug about the "rotational"
 attribute on virtio-blk disks
Message-ID: <20200723111514.eobzyktmpxi3fsez@steredhat.lan>
References: <20200716080614.GA18456@redhat.com>
 <20200716093344.7molwklwco4sdtvs@steredhat>
 <20200723103239.GD186372@stefanha-x1.localdomain>
 <20200723104056.GN3888@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200723104056.GN3888@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, qemu-discuss@nongnu.org
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

On Thu, Jul 23, 2020 at 11:40:56AM +0100, Richard W.M. Jones wrote:
> On Thu, Jul 23, 2020 at 11:32:39AM +0100, Stefan Hajnoczi wrote:
> > On Thu, Jul 16, 2020 at 11:33:44AM +0200, Stefano Garzarella wrote:
> > > +Cc Michael, Stefan, virtualization@lists.linux-foundation.org
> > > 
> > > On Thu, Jul 16, 2020 at 09:06:14AM +0100, Richard W.M. Jones wrote:
> > > > 
> > > > https://bugzilla.redhat.com/show_bug.cgi?id=1857515
> > > > 
> > > > A virtio-blk disk which is backed by a raw file on an SSD,
> > > > inside the guest shows rotational = 1.
> > > > 
> > > > I assumed that qemu must have a "rotational" property for disks and
> > > > this would be communicated by virtio to the guest, but qemu and virtio
> > > > don't seem to have this.  Pretty surprising!  Is it called something
> > > > other than "rotational"?
> > > > 
> > > 
> > > I'm not sure if we need to add this property in QEMU, but in Linux
> > > I found these flags (include/linux/blkdev.h) for the block queues:
> > > 
> > >     #define QUEUE_FLAG_NONROT	6	/* non-rotational device (SSD) */
> > >     #define QUEUE_FLAG_VIRT		QUEUE_FLAG_NONROT /* paravirt device */
> > > 
> > > xen-blkfront driver is the only one that sets the QUEUE_FLAG_VIRT,
> > > should we do the same in the virtio-blk driver regardless of the backend?
> > 
> > The ability to control this flag would be interesting for performance
> > experiments.
> 
> I expect there's a pretty strong interaction between this feature and
> the shared guest io_uring stuff isn't there?  I'm not sure if it'll be
> a positive or negative effect though.

Yeah, it could be! I'll try it out in the next days.

> 
> Rich.
> 
> > The problem with changing the default is that regressions can be
> > expected. Certain workloads benefit while others regress.
> > 
> > I suggest:
> > 1. Make it controllable so that QUEUE_FLAG_NONROT can be set or clear
> >    (not hardcoded to a single value).
> > 2. The device can communicate the optimal setting from the host. The
> >    SCSI protocol already conveys this information. Virtio-blk needs a
> >    feature bit and possibly config space field.
> > 3. Make it migration-safe. It needs to be configured explicitly so the
> >    value doesn't change suddenly across migration.

Thanks for the suggestions.

I'll spend some time on this.

Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
