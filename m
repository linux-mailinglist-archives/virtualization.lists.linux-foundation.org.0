Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0267371A
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 20:59:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4327F146F;
	Wed, 24 Jul 2019 18:59:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 53E2BD73
	for <virtualization@lists.linux-foundation.org>;
	Wed, 22 May 2019 13:28:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from www.kot-begemot.co.uk (ivanoab6.miniserver.com [5.153.251.140])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9F547883
	for <virtualization@lists.linux-foundation.org>;
	Wed, 22 May 2019 13:28:35 +0000 (UTC)
Received: from [192.168.17.6] (helo=jain.kot-begemot.co.uk)
	by www.kot-begemot.co.uk with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <anton.ivanov@kot-begemot.co.uk>)
	id 1hTRIH-00045N-3j; Wed, 22 May 2019 13:28:33 +0000
Received: from jain.kot-begemot.co.uk ([192.168.3.3])
	by jain.kot-begemot.co.uk with esmtp (Exim 4.89)
	(envelope-from <anton.ivanov@kot-begemot.co.uk>)
	id 1hTRIE-0003iF-IX; Wed, 22 May 2019 14:28:32 +0100
Subject: Re: custom virt-io support (in user-mode-linux)
To: Johannes Berg <johannes@sipsolutions.net>, linux-um@lists.infradead.org,
	virtualization@lists.linux-foundation.org, qemu-devel@nongnu.org
References: <0952696452f5ff4e38d2417029243fc60efa33d6.camel@sipsolutions.net>
From: Anton Ivanov <anton.ivanov@kot-begemot.co.uk>
Message-ID: <ddeee710-d546-ff05-5c53-991a7d807067@kot-begemot.co.uk>
Date: Wed, 22 May 2019 14:28:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0952696452f5ff4e38d2417029243fc60efa33d6.camel@sipsolutions.net>
Content-Language: en-US
X-Spam-Score: -1.0
X-Spam-Score: -1.0
X-Clacks-Overhead: GNU Terry Pratchett
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 24 Jul 2019 18:59:23 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org



On 22/05/2019 14:02, Johannes Berg wrote:
> Hi,
> 
> While my main interest is mostly in UML right now [1] I've CC'ed the
> qemu and virtualization lists because something similar might actually
> apply to other types of virtualization.
> 
> I'm thinking about adding virt-io support to UML, but the tricky part is
> that while I want to use the virt-io basics (because it's a nice
> interface from the 'inside'), I don't actually want the stock drivers
> that are part of the kernel now (like virtio-net etc.) but rather
> something that integrates with wifi (probably building on hwsim).
> 
> The 'inside' interfaces aren't really a problem - just have a specific
> device ID for this, and then write a normal virtio kernel driver for it.
> 
> The 'outside' interfaces are where my thinking breaks down right now.
> 
> Looking at lkl, the outside is just all implemented in lkl as code that
> gets linked to the library, so in UML terms it'd just be extra 'outside'
> code like the timer handling or other netdev stuff we have today.
> Looking at qemu, it's of course also implemented there, and then
> interfaces with the real network, console abstraction, etc.
> 
> However, like I said above, I really need something very custom and not
> likely to make it upstream to any project (because what point is that if
> you cannot connect to the rest of the environment I'm building), so I'm
> thinking that perhaps it should be possible to write an abstract
> 'outside' that lets you interact with it really from out-of-process?
> Perhaps through some kind of shared memory segment? I think that gets
> tricky with virt-io doing DMA (I think it does?) though, so that part
> would have to be implemented directly and not out-of-process?
> 
> But really that's why I'm asking - is there a better way than to just
> link the device-side virt-io code into the same binary (be it lkl lib,
> uml binary, qemu binary)?
> 
> Thanks,
> johannes
> 
> [1] Actually, I've considered using qemu, but it doesn't have
> virtualized time and doesn't seem to support TSC virtualization. I guess
> I could remove TSC from the guest CPU and add a virtualized HPET, but
> I've yet to convince myself this works - on UML I made virtual time as a
> prototype already:
> https://patchwork.ozlabs.org/patch/1095814/
> (though my real goal isn't to just skip time forward when the host goes
> idle, it's to sync with other simulated components)
> 
> 
> _______________________________________________
> linux-um mailing list
> linux-um@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-um
> 

I have looked at using virtio semantics in UML in the past around the 
point when I wanted to make the recvmmsg/sendmmsg vector drivers common 
in UML and QEMU. It is certainly possible,

I went for the native approach at the end though.

-- 
Anton R. Ivanov
https://www.kot-begemot.co.uk/
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
