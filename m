Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C548C27F95
	for <lists.virtualization@lfdr.de>; Thu, 23 May 2019 16:28:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 66E74E4A;
	Thu, 23 May 2019 14:25:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 107C8E40
	for <virtualization@lists.linux-foundation.org>;
	Thu, 23 May 2019 14:25:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4250881A
	for <virtualization@lists.linux-foundation.org>;
	Thu, 23 May 2019 14:25:56 +0000 (UTC)
Received: by sipsolutions.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <johannes@sipsolutions.net>)
	id 1hTofJ-00042W-Kh; Thu, 23 May 2019 16:25:53 +0200
Message-ID: <41d64b8971a097d1568f947517b45d09c156ccc8.camel@sipsolutions.net>
Subject: Re: [Qemu-devel] custom virt-io support (in user-mode-linux)
From: Johannes Berg <johannes@sipsolutions.net>
To: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 23 May 2019 16:25:52 +0200
In-Reply-To: <20190523115950.GH26632@stefanha-x1.localdomain>
	(sfid-20190523_135953_660617_C54B8FAF)
References: <0952696452f5ff4e38d2417029243fc60efa33d6.camel@sipsolutions.net>
	<20190523115950.GH26632@stefanha-x1.localdomain>
	(sfid-20190523_135953_660617_C54B8FAF)
X-Mailer: Evolution 3.28.5 (3.28.5-2.fc28) 
Mime-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: ido@wizery.com, linux-um@lists.infradead.org, qemu-devel@nongnu.org,
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

Hi Stefan,

> Check out vhost-user.  It's a protocol for running a subset of a VIRTIO
> device's emulation in a separate process (usually just the data plane
> with the PCI emulation and other configuration/setup still handled by
> QEMU).

Yes, I think that's basically what I'm looking for.

> vhost-user uses a UNIX domain socket to pass file descriptors to shared
> memory regions.  This way the vhost-user device backend process has
> access to guest RAM.
> 
> This would be quite different for UML since my understanding is you
> don't have guest RAM but actual host Linux processes, but vhost-user
> might still give you ideas:
> https://git.qemu.org/?p=qemu.git;a=blob_plain;f=docs/interop/vhost-user.rst;hb=HEAD

I guess it could still be implemented. Do you know how qemu actually
creates the shared memory region though? It's normal inside kernel
memory, no?

Ah, no, I see ... you have to give -mem-path and then the entire guest
memory isn't allocated as anonymous memory but from a file, and then you
can pass a descriptor to that file and effectively the client/slave of
vhost-user can access the whole guest's memory. Interesting. Next you're
going to want an IOMMU there, not just fake one, to protect against
hostile virt-user client? Not that I care :-)

UML in fact already maps all of its memory as a file (see arch/um/
create_mem_file()), so this part is easy.

What confused me at first is how all this talks about the ioctl()
interface, but I think I understand now - it's basically replacing
ioctl() with talking to a client.

So ultimately, it would actually seem "pretty simple".

Not sure I understand why there's all this stuff about multiple FDs,
once you have access to the guest's memory, why do you still need a
second (or more) FDs?

Also, not sure I understand how the client is started?

Once we have a connection, I guess as a client I'd at the very least
have to handle
 * VHOST_USER_GET_FEATURES and reply with the features, obviously, which
   is in this case just VHOST_USER_F_PROTOCOL_FEATURES?

 * VHOST_USER_SET_FEATURES - not sure, what would that do? the master
   sends VHOST_USER_GET_PROTOCOL_FEATURES which is with this feature
   bit? Especially since it says: "Slave that reported
   VHOST_USER_F_PROTOCOL_FEATURES must support this message even before
   VHOST_USER_SET_FEATURES was called."

 * VHOST_USER_GET_PROTOCOL_FEATURES - looking at the list, most I don't
   really need here, but OK

 * VHOST_USER_SET_OWNER - ??

 * VHOST_USER_RESET_OWNER - ignore

 * VHOST_USER_SET_MEM_TABLE - store the data/FDs for later use, I guess

 * VHOST_USER_SET_VRING_NUM - store the data for later use
 * VHOST_USER_SET_VRING_ADDR - dito
 * VHOST_USER_SET_VRING_BASE - dito
 * VHOST_USER_SET_VRING_KICK - start epoll on the FD (assuming there is
                               one, give up if not?) - well, if ring is
                               enabled?
 * VHOST_USER_SET_VRING_CALL - ...

I guess there might be better documentation on the ioctl interfaces?


Do you know if there's a sample client/server somewhere?

I guess we should implement the server in UML like it is in QEMU (unless
we can figure out how to virtualize the time with HPET or something in
QEMU) and then have our client and kernel driver for it...


Thanks a lot!

johannes

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
