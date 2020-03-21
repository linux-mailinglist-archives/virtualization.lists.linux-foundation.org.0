Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AB618E29F
	for <lists.virtualization@lfdr.de>; Sat, 21 Mar 2020 16:40:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6D08A87836;
	Sat, 21 Mar 2020 15:40:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aLNqkpCg5dFl; Sat, 21 Mar 2020 15:40:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 911ED87034;
	Sat, 21 Mar 2020 15:40:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A694C07FF;
	Sat, 21 Mar 2020 15:40:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4BED0C07FF
 for <virtualization@lists.linux-foundation.org>;
 Sat, 21 Mar 2020 15:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 33FF2203FA
 for <virtualization@lists.linux-foundation.org>;
 Sat, 21 Mar 2020 15:40:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJVrmV6y4Msg
 for <virtualization@lists.linux-foundation.org>;
 Sat, 21 Mar 2020 15:40:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 5C642203D4
 for <virtualization@lists.linux-foundation.org>;
 Sat, 21 Mar 2020 15:40:38 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B99B33D3; Sat, 21 Mar 2020 16:40:33 +0100 (CET)
Date: Sat, 21 Mar 2020 16:40:31 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH 21/70] x86/boot/compressed/64: Add function to map a page
 unencrypted
Message-ID: <20200321154031.GN5122@8bytes.org>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-22-joro@8bytes.org>
 <alpine.DEB.2.21.2003201350300.205664@chino.kir.corp.google.com>
 <8a50c19f-aaf8-90bd-a415-0e3b71e5a010@intel.com>
 <20200320221213.GK5122@8bytes.org>
 <9b69d49f-969c-5720-5723-f89ff0e000c0@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9b69d49f-969c-5720-5723-f89ff0e000c0@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, x86@kernel.org,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 Andy Lutomirski <luto@kernel.org>, hpa@zytor.com,
 David Rientjes <rientjes@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>
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

On Fri, Mar 20, 2020 at 03:26:09PM -0700, Dave Hansen wrote:
> In any case, I thought this all came through initialize_identity_maps(),
> which does, for instance:
> 
>         mapping_info.page_flag = __PAGE_KERNEL_LARGE_EXEC | sme_me_mask;
> 
> Where:
> 
> #define __PAGE_KERNEL_LARGE_EXEC (__PP|__RW|   0|___A|   0|___D|_PSE|___G)
> 
> That looks like it has the Global bit set.  Does that not apply here
> somehow?

No, as the value of %cr4 at boot is 0x00000020, so PGE is not set and
global pages are not enabled. It wouldn't make sense anyhow, as global
pages only make sense when there are more than one address space, which
is not the case that early in boot.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
