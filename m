Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1208E161EEB
	for <lists.virtualization@lfdr.de>; Tue, 18 Feb 2020 03:21:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 78DC786887;
	Tue, 18 Feb 2020 02:21:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1UDTfkmrX3zA; Tue, 18 Feb 2020 02:21:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 079AD86747;
	Tue, 18 Feb 2020 02:21:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E55B7C013E;
	Tue, 18 Feb 2020 02:21:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B563C013E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 02:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 385DE84AB2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 02:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id azS1v5Vij8XO
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 02:21:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 330E884906
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 02:21:31 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t14so1188719wmi.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 18:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eY7gqSVNopqtgZAFLrrVT+eoXLnh2uTk4VjIyhxxVUI=;
 b=lWfEjZdwTlpzTJU/5rhFxfMC9DhmiD6MQKthqW76Hbv0XfOiGyqGDu5RldcdpYXDW8
 8VC2MGu7JmRBUL9fqnyzhiIDG3lvptGawu3597QnUhz3j5vLjUvlxqf/5+0NIUht2qA6
 uWtDKT3in5vo4L05ycc8PSKWD8SX6KfjeE/VrkPHoXR6vYccQNX6hznzbhKuUHFPgrjn
 dU8UTGnKjuMJikK87oHmZHLKnJRriEiSnKE3m9Jf9zKK0NQynG9nod5ORwABMAmNSD73
 iWWpflgLYPICza/RpijPeYAYt6nJdVlb+5kUCHV5nhUDfMDi/MN5OigyycC/QcKsiuKL
 UE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eY7gqSVNopqtgZAFLrrVT+eoXLnh2uTk4VjIyhxxVUI=;
 b=WT18BamuTWIRbDy+OCsD2uHBKxk/nLEcYl/JzbsRVpOg0DAxyPhis2tod0Egb/hHJv
 i2BF7XLVMBLC20prmS4BARArZMgaurIidfNchc98a9xQmA2jO788TQn4UkrZhss4U3CY
 R7MkQoclShLjkEFkRn0fcuK970dfT61fz8M3eSrmaxlO5IboWJIQKVJle/1gaipX//Um
 Bl10RIOO4xgwh+ys0hCa5tK25jiLdetXDj97hBzzasEuB3se4FI0mypz2mGNPeeueij4
 PZXl/dNrqG/mcqlBsTafBzrV0lpZNJ7Xe00yLgacXlKBuCD3fdfDxSf80lNI5hRUYKNV
 joPQ==
X-Gm-Message-State: APjAAAVedqxnCtTZ03BgReCel+wjnJ6ADOKbiYfen6HhljZuNu/jZaGB
 bOi3D/LfJzYLcFNPZlRiJUJL7+Gcvigaxy/oOvE=
X-Google-Smtp-Source: APXvYqyDtuMB29KXJ2WCyqWXVgI1TB7/0mLR6wN9PM4aCO4sInPlQNWZ2Ru4+ybFn+ncPUAjgjEnVEw1970/5hQdhZ8=
X-Received: by 2002:a1c:5441:: with SMTP id p1mr2198840wmi.161.1581992489535; 
 Mon, 17 Feb 2020 18:21:29 -0800 (PST)
MIME-Version: 1.0
References: <20200213123728.61216-1-pasic@linux.ibm.com>
 <20200213123728.61216-2-pasic@linux.ibm.com>
In-Reply-To: <20200213123728.61216-2-pasic@linux.ibm.com>
From: Ming Lei <tom.leiming@gmail.com>
Date: Tue, 18 Feb 2020 10:21:18 +0800
Message-ID: <CACVXFVNiADTW_vLVc1bUSa0CoViLbVzoMnSJW4=sx=MCE-xUPw@mail.gmail.com>
Subject: Re: [PATCH 1/2] virtio-blk: fix hw_queue stopped on arbitrary error
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-s390 <linux-s390@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Ram Pai <linuxram@us.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 linux-block <linux-block@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
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

On Thu, Feb 13, 2020 at 8:38 PM Halil Pasic <pasic@linux.ibm.com> wrote:
>
> Since nobody else is going to restart our hw_queue for us, the
> blk_mq_start_stopped_hw_queues() is in virtblk_done() is not sufficient
> necessarily sufficient to ensure that the queue will get started again.
> In case of global resource outage (-ENOMEM because mapping failure,
> because of swiotlb full) our virtqueue may be empty and we can get
> stuck with a stopped hw_queue.
>
> Let us not stop the queue on arbitrary errors, but only on -EONSPC which
> indicates a full virtqueue, where the hw_queue is guaranteed to get
> started by virtblk_done() before when it makes sense to carry on
> submitting requests. Let us also remove a stale comment.

The generic solution may be to stop queue only when there is any
in-flight request
not completed.

Checking -ENOMEM may not be enough, given -EIO can be returned from
virtqueue_add()
too in case of dma map failure.

Thanks,
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
