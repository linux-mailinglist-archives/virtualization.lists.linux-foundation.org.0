Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2F5388DEC
	for <lists.virtualization@lfdr.de>; Wed, 19 May 2021 14:22:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CD294011B;
	Wed, 19 May 2021 12:22:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2u0VRBJe0BHK; Wed, 19 May 2021 12:22:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CC1C40154;
	Wed, 19 May 2021 12:22:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3210C0001;
	Wed, 19 May 2021 12:22:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D6BEC0001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 12:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 442F44061A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 12:22:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A49rCVwH38pT
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 12:22:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 074274062F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 12:22:52 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 562EB2FA; Wed, 19 May 2021 14:22:49 +0200 (CEST)
Date: Wed, 19 May 2021 14:22:48 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 4/6] Revert "x86/sev-es: Handle string port IO to kernel
 memory properly"
Message-ID: <YKUDGIrnR2doYEKj@8bytes.org>
References: <20210512075445.18935-1-joro@8bytes.org>
 <20210512075445.18935-5-joro@8bytes.org>
 <YJwSlVnHb0SZTSrG@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJwSlVnHb0SZTSrG@google.com>
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, x86@kernel.org,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 Hyunwook Baek <baekhw@google.com>, linux-coco@lists.linux.dev,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
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

On Wed, May 12, 2021 at 05:38:29PM +0000, Sean Christopherson wrote:
> Alternatively, and probably even better, fold this revert into the switch to
> the unchecked version (sounds like those will use kernel-specific flavors?).

I folded this revert into the previous commit. But I kept the
__get_user()/__put_user() calls and just added a comment explaining why
they are used and why it is safe to use them.

After all, even the get_kernel*() functions call __get_user_size() under
the hood.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
