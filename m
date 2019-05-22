Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2B3264F4
	for <lists.virtualization@lfdr.de>; Wed, 22 May 2019 15:46:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D640CDB7;
	Wed, 22 May 2019 13:46:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 64A5DDA4
	for <virtualization@lists.linux-foundation.org>;
	Wed, 22 May 2019 13:46:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E40CE879
	for <virtualization@lists.linux-foundation.org>;
	Wed, 22 May 2019 13:46:51 +0000 (UTC)
Received: by sipsolutions.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <johannes@sipsolutions.net>)
	id 1hTRZw-0004Ak-Sb; Wed, 22 May 2019 15:46:48 +0200
Message-ID: <8b30e5cea2692d62fd7f486fc98effdb589a1412.camel@sipsolutions.net>
Subject: Re: custom virt-io support (in user-mode-linux)
From: Johannes Berg <johannes@sipsolutions.net>
To: Anton Ivanov <anton.ivanov@kot-begemot.co.uk>, 
	linux-um@lists.infradead.org, virtualization@lists.linux-foundation.org,
	qemu-devel@nongnu.org
Date: Wed, 22 May 2019 15:46:47 +0200
In-Reply-To: <ddeee710-d546-ff05-5c53-991a7d807067@kot-begemot.co.uk>
References: <0952696452f5ff4e38d2417029243fc60efa33d6.camel@sipsolutions.net>
	<ddeee710-d546-ff05-5c53-991a7d807067@kot-begemot.co.uk>
X-Mailer: Evolution 3.28.5 (3.28.5-2.fc28) 
Mime-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

Hi Anton,

> > I'm thinking about adding virt-io support to UML, but the tricky part is
> > that while I want to use the virt-io basics (because it's a nice
> > interface from the 'inside'), I don't actually want the stock drivers
> > that are part of the kernel now (like virtio-net etc.) but rather
> > something that integrates with wifi (probably building on hwsim).

> I have looked at using virtio semantics in UML in the past around the 
> point when I wanted to make the recvmmsg/sendmmsg vector drivers common 
> in UML and QEMU. It is certainly possible,
> 
> I went for the native approach at the end though.

Hmm. I'm not sure what you mean by either :-)

Is there any commonality between the vector drivers? I can't see how
that'd work without a bus abstraction (like virtio) in qemu? I mean, the
kernel driver just calls uml_vector_sendmmsg(), which I'd say belongs
more to the 'outside world', but that can't really be done in qemu?

Ok, I guess then I see what you mean by 'native' though.

Similarly, of course, I can implement arbitrary virt-io devices - just
the kernel side doesn't call a function like uml_vector_sendmmsg()
directly, but instead the virt-io model, and the model calls the
function, which essentially is the same just with a (convenient)
abstraction layer.

But this leaves the fundamental fact the model code ("vector_user.c" or
a similar "virtio_user.c") is still part of the build.

I guess what I'm thinking is have something like "virtio_user_rpc.c"
that uses some appropriate RPC to interact with the real model. IOW,
rather than having all the model-specific logic actually be here (like
vector_user.c actually knows how to send network packets over a real
socket fd), try to call out to some RPC that contains the real model.

Now that I thought about it further, I guess my question boils down to
"did anyone ever think about doing RPC for Virt-IO instead of putting
the entire device model into the hypervisor/emulator/...".

johannes

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
