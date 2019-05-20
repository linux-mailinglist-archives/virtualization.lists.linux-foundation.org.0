Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CE52313C
	for <lists.virtualization@lfdr.de>; Mon, 20 May 2019 12:22:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 00777C6D;
	Mon, 20 May 2019 10:22:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BDE5AC3E
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 10:22:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5334F821
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 10:22:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7FBF20276;
	Mon, 20 May 2019 10:21:55 +0000 (UTC)
Received: from gondolin (ovpn-204-110.brq.redhat.com [10.40.204.110])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F99A5C221;
	Mon, 20 May 2019 10:21:46 +0000 (UTC)
Date: Mon, 20 May 2019 12:21:43 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 06/10] s390/cio: add basic protected virtualization support
Message-ID: <20190520122143.259ff8df.cohuck@redhat.com>
In-Reply-To: <20190518201100.0fd07d7f.pasic@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-7-pasic@linux.ibm.com>
	<20190513114136.783c851c.cohuck@redhat.com>
	<20190515225158.301af387.pasic@linux.ibm.com>
	<20190516082928.1371696b.cohuck@redhat.com>
	<20190518201100.0fd07d7f.pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 20 May 2019 10:21:56 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Farhan Ali <alifm@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Viktor Mihajlovski <mihajlov@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Sat, 18 May 2019 20:11:00 +0200
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Thu, 16 May 2019 08:29:28 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > On Wed, 15 May 2019 22:51:58 +0200
> > Halil Pasic <pasic@linux.ibm.com> wrote:

> Don't like the second sentence. How about "It handles neither QDIO
> in the common code, nor any device type specific stuff (like channel
> programs constructed by the DADS driver)."

Sounds good to me (with s/DADS/DASD/ :)

> > > A side note: making the subchannel device 'own' the DMA stuff of a
> > > ccw device (something that was discussed in the RFC thread) is tricky
> > > because the ccw device may outlive the subchannel (all that orphan
> > > stuff).  
> > 
> > Yes, that's... eww. Not really a problem for virtio-ccw devices (which
> > do not support the disconnected state), but can we make DMA and the
> > subchannel moving play nice with each other at all?
> >   
> 
> I don't quite understand the question. This series does not have any
> problems with that AFAIU. Can you please clarify?

Wait, weren't you saying that there actually is a problem?

We seem to have the following situation:
- the device per se is represented by the ccw device
- the subchannel is the means of communication, and dma is tied to the
  (I/O ?) subchannel
- the machine check handling code may move a ccw device to a different
  subchannel, or even to a fake subchannel (orphanage handling)

The moving won't happen with virtio-ccw devices (as they do not support
the disconnected state, which is a prereq for being moved around), but
at a glance, this looks like it is worth some more thought.

- Are all (I/O) subchannels using e.g. the same dma size? (TBH, that
  question sounds a bit silly: that should be a property belonging to
  the ccw device, shouldn't it?)
- What dma properties does the fake subchannel have? (Probably none, as
  its only purpose is to serve as a parent for otherwise parentless
  disconnected ccw devices, and is therefore not involved in any I/O.)
- There needs to be some kind of handling in the machine check code, I
  guess? We would probably need a different allocation if we end up at
  a different subchannel?

I think we can assume that the dma size is at most 31 bits (since that
is what the common I/O layer needs); but can we also assume that it
will always be at least 31 bits?

My take on this is that we should be sure that we're not digging
ourselves a hole that will be hard to get out of again should we want to
support non-virtio-ccw in the future, not that the current
implementation is necessarily broken.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
