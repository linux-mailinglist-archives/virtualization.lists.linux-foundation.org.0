Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6513EEB3A
	for <lists.virtualization@lfdr.de>; Tue, 17 Aug 2021 12:49:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B1EF60802;
	Tue, 17 Aug 2021 10:49:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iq1jLo5BPrz7; Tue, 17 Aug 2021 10:49:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7FE9860826;
	Tue, 17 Aug 2021 10:49:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 057AFC000E;
	Tue, 17 Aug 2021 10:49:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37FE7C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 10:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19C7F6081E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 10:49:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jCKghPenb7yQ
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 10:49:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E631F60802
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 10:49:44 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8893A21E50;
 Tue, 17 Aug 2021 10:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629197382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=96XN1J5spWGmKPZIMEzopEXksQaOhHaNCi9bFcJ0r2g=;
 b=RYrqaxrDYR1Yb016O3sREU6+ylgYLF8HcZOA8w+LqfAVLoi6DVfDjqsHF4CSQWGQnF+b4p
 3GdTKRSQ5tDG3RH8CyKe9g+bO/6p7jmKznQSdqXhwhFCP2fgjaKtteVxNk9jC9H3vhvYSP
 Y2frfVrq1GRalWkjmyv//VkHF2Lfu68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629197382;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=96XN1J5spWGmKPZIMEzopEXksQaOhHaNCi9bFcJ0r2g=;
 b=L2n6xR1wFNVYd5PFInbqaqfP+79KQgNpgTMyaMgG/Cqm73zpefq52B0NQgd0ZMxaO0W6Y+
 t2GDBJsgmf9TI0DQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 1335D13318;
 Tue, 17 Aug 2021 10:49:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id LTPiAkaUG2EBHAAAGKfGzw
 (envelope-from <jroedel@suse.de>); Tue, 17 Aug 2021 10:49:42 +0000
Date: Tue, 17 Aug 2021 12:49:40 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Marc Orr <marcorr@google.com>
Subject: Re: [kvm-unit-tests PATCH 0/6] Initial x86_64 UEFI support
Message-ID: <YRuURERGp8CQ1jAX@suse.de>
References: <20210702114820.16712-1-varad.gautam@suse.com>
 <CAA03e5HCdx2sLRqs2jkLDz3z8SB9JhCdxGv7Y6_ER-kMaqHXUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAA03e5HCdx2sLRqs2jkLDz3z8SB9JhCdxGv7Y6_ER-kMaqHXUg@mail.gmail.com>
Cc: "Lendacky, Thomas" <thomas.lendacky@amd.com>, drjones@redhat.com, "Singh,
 Brijesh" <brijesh.singh@amd.com>, kvm list <kvm@vger.kernel.org>,
 Tom Roeder <tmroeder@google.com>,
 "Hyunwook \(Wooky\) Baek" <baekhw@google.com>,
 virtualization@lists.linux-foundation.org, Zixuan Wang <zixuanwang@google.com>,
 Erdem Aktas <erdemaktas@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 bp@suse.de
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

Hi Marc,

On Fri, Aug 13, 2021 at 11:44:39AM -0700, Marc Orr wrote:
> To date, we have _most_ x86 test cases (39/44) working under UEFI and
> we've also got some of the test cases to boot under SEV-ES, using the
> UEFI #VC handler.

While the EFI APP approach simplifies the implementation a lot, I don't
think it is the best path to SEV and TDX testing for a couple of
reasons:

	1) It leaves the details of #VC/#VE handling and the SEV-ES
	   specific communication channels (GHCB) under control of the
	   firmware. So we can't reliably test those interfaces from an
	   EFI APP.

	2) Same for the memory validation/acceptance interface needed
	   for SEV-SNP and TDX. Using an EFI APP leaves those under
	   firmware control and we are not able to reliably test them.

	3) The IDT also stays under control of the firmware in an EFI
	   APP, otherwise the firmware couldn't provide a #VC handler.
	   This makes it unreliable to test anything IDT or IRQ related.

	4) Relying on the firmware #VC hanlder limits the tests to its
	   abilities. Implementing a separate #VC handler routine for
	   kvm-unit-tests is more work, but it makes test development
	   much more flexible.

So it comes down to the fact that and EFI APP leaves control over
SEV/TDX specific hypervisor interfaces in the firmware, making it hard
and unreliable to test these interfaces from kvm-unit-tests. The stub
approach on the other side gives the tests full control over the VM,
allowing to test all aspects of the guest-host interface.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
