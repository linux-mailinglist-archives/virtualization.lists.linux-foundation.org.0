Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 717943B1741
	for <lists.virtualization@lfdr.de>; Wed, 23 Jun 2021 11:49:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D640D6065D;
	Wed, 23 Jun 2021 09:49:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rCfBj43OUix5; Wed, 23 Jun 2021 09:49:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A2110605F2;
	Wed, 23 Jun 2021 09:49:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19EB9C000E;
	Wed, 23 Jun 2021 09:49:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 589EFC000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Jun 2021 09:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3863C40283
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Jun 2021 09:49:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.de header.b="mpcL6YYN";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="nV2ZmUFl"; dkim=pass (1024-bit key)
 header.d=suse.de header.b="mpcL6YYN"; dkim=neutral
 reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="nV2ZmUFl"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TxPRSv8RrGMW
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Jun 2021 09:49:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF31340168
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Jun 2021 09:49:44 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C1ECE21970;
 Wed, 23 Jun 2021 09:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624441781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ux+joYOB/UsMHX7POd5I9X3miorAtdiYmMYNa+mcW6E=;
 b=mpcL6YYNLF0eM6WXm1Q4WixD/1Y0RnUjjEOMj46KrRfzIvpiyEyvAz2w4RPKVf8tHkkxoL
 6S7sXh6xbj3f802IhtyD/00gI6cHXGKk3DM6+mNDgFt2DUmLwag5CRxqHvdI5KzJCzSv13
 WIGLqCJgTEuPkg1lftiUMCsBAGXzPEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624441781;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ux+joYOB/UsMHX7POd5I9X3miorAtdiYmMYNa+mcW6E=;
 b=nV2ZmUFlTFTEi4JFefYmjQ6Nsp0O9ka/R/08BSGYZLCHK4k+RdQVrxkZ5IGj8UMTmpFkR8
 GOMXtbRIVPf1eQDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id EBBD211A97;
 Wed, 23 Jun 2021 09:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624441781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ux+joYOB/UsMHX7POd5I9X3miorAtdiYmMYNa+mcW6E=;
 b=mpcL6YYNLF0eM6WXm1Q4WixD/1Y0RnUjjEOMj46KrRfzIvpiyEyvAz2w4RPKVf8tHkkxoL
 6S7sXh6xbj3f802IhtyD/00gI6cHXGKk3DM6+mNDgFt2DUmLwag5CRxqHvdI5KzJCzSv13
 WIGLqCJgTEuPkg1lftiUMCsBAGXzPEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624441781;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ux+joYOB/UsMHX7POd5I9X3miorAtdiYmMYNa+mcW6E=;
 b=nV2ZmUFlTFTEi4JFefYmjQ6Nsp0O9ka/R/08BSGYZLCHK4k+RdQVrxkZ5IGj8UMTmpFkR8
 GOMXtbRIVPf1eQDA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id FdfVN7QD02ATSgAALh3uQQ
 (envelope-from <jroedel@suse.de>); Wed, 23 Jun 2021 09:49:40 +0000
Date: Wed, 23 Jun 2021 11:49:39 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 2/3] x86/sev: Add defines for GHCB version 2 MSR protocol
 requests
Message-ID: <YNMDs5iuhCxeII/U@suse.de>
References: <20210622144825.27588-1-joro@8bytes.org>
 <20210622144825.27588-3-joro@8bytes.org>
 <YNLXQIZ5e1wjkshG@8bytes.org> <YNL/wpVY1PmGJASW@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YNL/wpVY1PmGJASW@zn.tnic>
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Kees Cook <keescook@chromium.org>,
 Cfir Cohen <cfir@google.com>, linux-coco@lists.linux.dev,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
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

On Wed, Jun 23, 2021 at 11:32:50AM +0200, Borislav Petkov wrote:
> Ok, so I took a critical look at this and it doesn't make sense to have
> a differently named define each time you need the [63:12] slice of
> GHCBData. So you can simply use GHCB_DATA(msr_value) instead, see below.
> 
> Complaints?

Looks good to me.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
