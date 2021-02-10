Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 437BB316A24
	for <lists.virtualization@lfdr.de>; Wed, 10 Feb 2021 16:28:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98C076F981
	for <lists.virtualization@lfdr.de>; Wed, 10 Feb 2021 15:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UhFqkqrkLgLw for <lists.virtualization@lfdr.de>;
	Wed, 10 Feb 2021 15:28:46 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id 84E8E6F952; Wed, 10 Feb 2021 15:28:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E0606F914;
	Wed, 10 Feb 2021 15:28:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55109C1E6F;
	Wed, 10 Feb 2021 15:28:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53796C1E72
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 15:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3269F6F8E0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 15:28:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HZ_azPkNlRUW
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 15:28:08 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id 95E216F903; Wed, 10 Feb 2021 15:28:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9D596F74F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 15:27:35 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 929CB3C2; Wed, 10 Feb 2021 16:27:32 +0100 (CET)
Date: Wed, 10 Feb 2021 16:27:31 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH 0/7] x86/seves: Support 32-bit boot path and other updates
Message-ID: <20210210152730.GD7302@8bytes.org>
References: <20210210102135.30667-1-joro@8bytes.org>
 <20210210145835.GE358613@fedora> <20210210151224.GC7302@8bytes.org>
 <20210210151938.GH358613@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210210151938.GH358613@fedora>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, daniel.kiper@oracle.com, x86@kernel.org,
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

On Wed, Feb 10, 2021 at 10:19:38AM -0500, Konrad Rzeszutek Wilk wrote:
> I think I am missing something obvious here - but why would you want
> EFI support disabled?

I don't want EFI support disabled, this is just a way to trigger this
boot-path. In real life it is triggered by 32-bit GRUB EFI builds. But I
havn't had one of those for testing, so I used another way to trigger
this path.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
