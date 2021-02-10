Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E0C316B93
	for <lists.virtualization@lfdr.de>; Wed, 10 Feb 2021 17:46:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6E11E86E6C;
	Wed, 10 Feb 2021 16:46:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b3sn5wdLDeCX; Wed, 10 Feb 2021 16:46:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2414886E3E;
	Wed, 10 Feb 2021 16:46:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F22DEC013A;
	Wed, 10 Feb 2021 16:46:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58203C013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 16:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 47D2A86B00
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 16:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i-LAN3S4lRNO
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 16:46:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7026B86AFD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 16:46:47 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 6B01C3C2; Wed, 10 Feb 2021 17:46:44 +0100 (CET)
Date: Wed, 10 Feb 2021 17:46:42 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH 6/7] x86/boot/compressed/64: Check SEV encryption in
 32-bit boot-path
Message-ID: <20210210164642.GE7302@8bytes.org>
References: <20210210102135.30667-1-joro@8bytes.org>
 <20210210102135.30667-7-joro@8bytes.org>
 <0526b64e-8ef0-2e3c-06a7-e07835be160c@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0526b64e-8ef0-2e3c-06a7-e07835be160c@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, x86@kernel.org,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Erdem Aktas <erdemaktas@google.com>
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

On Wed, Feb 10, 2021 at 08:25:11AM -0800, Dave Hansen wrote:
> This is all very cute.  But, if this fails, it means that the .data
> section is now garbage, right?.  I guess failing here is less
> entertaining than trying to run the kernel with random garbage in .data,
> but it doesn't make it very far either way, right?

Yes, if this fails the .data section is garbage, and more importantly,
the .text section of the decompressed kernel image would be garbage too.
The kernel won't get very far, but could possibly be tricked into
releasing secrets to the hypervisor.

> Why bother with rdrand, though?  Couldn't you just pick any old piece of
> .data and compare before and after?

It is important that the Hypervisor can't predict what data will be
written. It is written with paging off, so it will implicitly be
encrypted. If the Hypervisor knows the data, it could use the small time
window until it is read again to remap the gpa to a page with the
expected data.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
