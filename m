Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A56922CCAD
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 19:56:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E8B9088A2F;
	Fri, 24 Jul 2020 17:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wLOJdKGxk2wS; Fri, 24 Jul 2020 17:56:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8D31B88A28;
	Fri, 24 Jul 2020 17:56:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A76EC004C;
	Fri, 24 Jul 2020 17:56:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A2E0C004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7FDE5232BD
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:56:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HjvfXlGuTw6K
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:56:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by silver.osuosl.org (Postfix) with ESMTPS id A929B204A9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:56:06 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id o1so4914159plk.1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 10:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LPBr9y0mSQ0vEFDVd2yPcrY3mpjPcnCTz8oQxhRntWI=;
 b=eZoWliuezeOxys0b9UQOnD/o0lGyFr5fKeejVdFUARBWrlFx+qV4PZjxeb6W0f1v0q
 spduBP91FEopvvNX5ho4hKvodAgkrttgRK3rPTVXtOlImPSiICCvOps9A0ZVwkXhHHhW
 2aUmPdKVudVlnVPtPFeLyvUVR6CmhAVkjvfog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LPBr9y0mSQ0vEFDVd2yPcrY3mpjPcnCTz8oQxhRntWI=;
 b=j8ZRt24oT1jLrOtVlWx2gqXAIJ9nGaWAS7tZzziRl24R6HU3RRJ+PercGS4zFysvUH
 4/mvsI7Qhq4V4EPiNyepjkgXplD1QlQZVeF7rHWkZQ0LjDWMehAwExwNP07QNa0e0EKL
 4ZrDpAHnDcffRC1AX1VrA7Rf4BmZ0uFuW/FbGWngTa2LIhKoAYB88jOvOh31vEFfg2A+
 aW24xiQox+LA+JIqqeIvDX/q3iJnUPMYjfrcfTdlFDamRvBkyiwUXrvhgFgRRhLpLr9f
 M9wmDDAwrZMb0sMYXI0SjgKa2oBMxy6XQQkRIKERQt7q6wRU5MXtREGUGZgXLmpfirPq
 FfmA==
X-Gm-Message-State: AOAM533dAuOxqIP/vQ8VbW8MZxoTPETI3T7SWAW7Qzxq0fCxe2gVm2Yd
 8G2Kjb7Wm9sFuWjq9wYGBJ2XTQ==
X-Google-Smtp-Source: ABdhPJyDax/qJPR4ZLz3NJokDK6V9QQCwKq9zwdj3ZJ38OEFknglmOqbh2MmPwVgkyNP/voUnR7jUA==
X-Received: by 2002:a17:90a:22ab:: with SMTP id
 s40mr6997041pjc.117.1595613366344; 
 Fri, 24 Jul 2020 10:56:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id f207sm7271770pfa.107.2020.07.24.10.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 10:56:05 -0700 (PDT)
Date: Fri, 24 Jul 2020 10:56:04 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v5 71/75] x86/head/64: Rename start_cpu0
Message-ID: <202007241056.091E681@keescook>
References: <20200724160336.5435-1-joro@8bytes.org>
 <20200724160336.5435-72-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724160336.5435-72-joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Cfir Cohen <cfir@google.com>, x86@kernel.org, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Martin Radev <martin.b.radev@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Erdem Aktas <erdemaktas@google.com>,
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

On Fri, Jul 24, 2020 at 06:03:32PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> For SEV-ES this entry point will be used for restarting APs after they
> have been offlined. Remove the '0' from the name to reflect that.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
