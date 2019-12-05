Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 404AF114133
	for <lists.virtualization@lfdr.de>; Thu,  5 Dec 2019 14:06:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D3C1E88251;
	Thu,  5 Dec 2019 13:06:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u-0IRs5eSohJ; Thu,  5 Dec 2019 13:06:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 61390881AD;
	Thu,  5 Dec 2019 13:06:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 301D4C077D;
	Thu,  5 Dec 2019 13:06:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D1F2C077D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Dec 2019 13:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7073123420
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Dec 2019 13:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3A0wiwOPMFs4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Dec 2019 13:06:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id A6D20203A8
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Dec 2019 13:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575551201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pIbfnsWyjUzYuMMUtvP8cBzLFVnihHBsEg4LNJqdKgI=;
 b=ijhmthc0DRHlsgCY66E1VDmg1zh4LQ3oOBeZCY3WjIB2S/t5dDWeDoSCjDi+PD6sbW1LT1
 S9A8asNf0Ij3WGmCRouk/9HtgVsOZFgxj1ZH3A0lND3WeVqNYcIzGq+lQDu5hU6fytesYH
 dIrtXMWTaOuAC1dy/urGhC86LYuzeUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-7hcZwkCJNWex1a5zYOwlZw-1; Thu, 05 Dec 2019 08:06:37 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EC6CDB35;
 Thu,  5 Dec 2019 13:06:34 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-250.rdu2.redhat.com
 [10.10.120.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6179260135;
 Thu,  5 Dec 2019 13:06:31 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20191205072838.GA3237@sol.localdomain>
References: <20191205072838.GA3237@sol.localdomain>
 <000000000000a376820598b2eb97@google.com>
 <20191205054023.GA772@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: kernel BUG at fs/pipe.c:LINE!
MIME-Version: 1.0
Content-ID: <27080.1575551190.1@warthog.procyon.org.uk>
Date: Thu, 05 Dec 2019 13:06:30 +0000
Message-ID: <27081.1575551190@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 7hcZwkCJNWex1a5zYOwlZw-1
X-Mimecast-Spam-Score: 0
Cc: willy@infradead.org, arnd@arndb.de, jannh@google.com,
 syzbot <syzbot+d37abaade33a934f16f2@syzkaller.appspotmail.com>,
 amit@kernel.org, syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, virtualization@lists.linux-foundation.org,
 dhowells@redhat.com, miklos@szeredi.hu, viro@zeniv.linux.org.uk,
 gregkh@linuxfoundation.org, linux-fsdevel@vger.kernel.org
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

Eric Biggers <ebiggers@kernel.org> wrote:

> static __poll_t
> pipe_poll(struct file *filp, poll_table *wait)
> {
>         __poll_t mask;
>         struct pipe_inode_info *pipe = filp->private_data;
>         unsigned int head = READ_ONCE(pipe->head);
>         unsigned int tail = READ_ONCE(pipe->tail);
> 
>         poll_wait(filp, &pipe->wait, wait);
> 
>         BUG_ON(pipe_occupancy(head, tail) > pipe->ring_size);
> 
> It's not holding the pipe mutex, right?  So 'head', 'tail' and 'ring_size' can
> all be changed concurrently, and they aren't read atomically with respect to
> each other.
> 
> How do you propose to implement poll() correctly with the new head + tail
> approach?  Just take the mutex?

Firstly, the BUG_ON() check probably isn't necessary here - the same issue
with occupancy being seen to be greater than the queue depth existed
previously (there was no locking around the read of pipe->nrbufs and
pipe->buffers).  I added a sanity check.

Secondly, it should be possible to make it such that just the spinlock
suffices.  The following few patches make the main pipe read/write routines
use the spinlock so as not to be interfered with by notification insertion.

I didn't roll the spinlock out to splice and suchlike since I prohibit
splicing to a notifications pipe because of the iov_iter_revert() fun.

David

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
