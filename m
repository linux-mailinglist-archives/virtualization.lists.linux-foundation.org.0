Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7AEC898F
	for <lists.virtualization@lfdr.de>; Wed,  2 Oct 2019 15:27:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AFD15EC1;
	Wed,  2 Oct 2019 13:27:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6A59FDBE
	for <virtualization@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 13:27:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1A56B8BB
	for <virtualization@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 13:27:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5FA73300D20F;
	Wed,  2 Oct 2019 13:27:37 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EDF775C241;
	Wed,  2 Oct 2019 13:27:34 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 809AF220308; Wed,  2 Oct 2019 09:27:34 -0400 (EDT)
Date: Wed, 2 Oct 2019 09:27:34 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: virtq questions
Message-ID: <20191002132734.GA6972@redhat.com>
References: <CAJfpegsGNoT4NUai-=HHkqOrmjgMb=4TDk79EgxDBCd8fxCGZA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJfpegsGNoT4NUai-=HHkqOrmjgMb=4TDk79EgxDBCd8fxCGZA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 02 Oct 2019 13:27:37 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	virtualization@lists.linux-foundation.org
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

On Wed, Oct 02, 2019 at 09:40:11AM +0200, Miklos Szeredi wrote:
> Looking at the ugly retry logic in virtiofs and have some questions.

Hi Miklos,

What are you thinking w.r.t cleanup of retry logic. As of now we put
requests in a list and retry later with the help of a worker.

Other option will probably be block the submitter if queue is full. Make
it sleep, wake up after a while and retry submission.

> First one is, where do these features come from:
> 
> VIRTIO_F_RING_PACKED
> VIRTIO_RING_F_INDIRECT_DESC

Looks like these feature bits are supposed to be advertised by the device
if device supports these capabilities.

I see in qemu code that bunch of drivers are advertisig this capability.
(virtio_scsi, virtio_blk etc).

> 
> I see that in virtiofs "packed" is off and "indirect" is on.  Is this
> guaranteed?

I can't find specifying any feature bits in vhost-user-fs.c. So we
probably are getting a default value.

Thanks
Vivek
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
