Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6EF22CC9D
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 19:52:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4706A88A02;
	Fri, 24 Jul 2020 17:52:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bm-ggVWNBLI3; Fri, 24 Jul 2020 17:52:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5598788836;
	Fri, 24 Jul 2020 17:52:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27D52C004C;
	Fri, 24 Jul 2020 17:52:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7BB5AC004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6454C87257
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:52:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2TqGERNyRyEu
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:52:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 554498719F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:52:38 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id t15so5730176pjq.5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 10:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pJMZ9swT3K3bqjJGXw2k3ORIxQ+qFSg1qs4vP+1tpg4=;
 b=cdWoE2eg0lqtaBCE7gX8/22rPZSJybcSuLoAOGnkDhjuuDHjBqXvxoqznKJrXHU3o1
 iTxCtOeQqhFXAo17sRdniHvJKXR9VakV+aww3rop+nAi5XFiPGcfGlfmBDL//k6IuZ7a
 IW2nzon8XqUePb5x1bKZ2zyLYXpunn4GzgxYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pJMZ9swT3K3bqjJGXw2k3ORIxQ+qFSg1qs4vP+1tpg4=;
 b=GKCYssRpmWY2smGhUMpt83isSdHh8l98QybZd1XWHBtXCHenHdAAKsHw145XZGc35c
 u9zASA+SeK/ShucAmkU6HCQvZOf/nGg3a7kFAUiMssFNDtfB/ZmxSAtGVh1nkKFU9VNo
 qK2J5TrjJTuQfJqX7Jh7he6E4A3ZLr7f72tVLTk/mBOJ1I8ZE9Lj5xKtRrj1zBhv8ezl
 Wf6oUrUNfQAOlEHXJyIl5fFXzp6x1rLRAZG+hZi/TMX/+x5+B5lhslFUONVUEI8nzazi
 ZsAlJA+5hWSC6IYxc56Zwm1ZqHm9/8djy0vvRKvG5S3+2sYT6DtNyw7B4f+CXsYdpKVf
 NCjw==
X-Gm-Message-State: AOAM533OBoSTiRCWo6qlqCCgeQMfgENyeH8PsTY2vPZ1d6733ZHn/rmX
 skc8Iw5yjqK7z0cil+0LdXENeA==
X-Google-Smtp-Source: ABdhPJwHNZHpjJqrSuBBG12NUV/AuorcdxM+aZufctkjPno4wSr16cgJs0zf8rkmYhm9hIrfeFYV/A==
X-Received: by 2002:a17:902:e903:: with SMTP id
 k3mr9265756pld.148.1595613157934; 
 Fri, 24 Jul 2020 10:52:37 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id e28sm6990626pfm.177.2020.07.24.10.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 10:52:36 -0700 (PDT)
Date: Fri, 24 Jul 2020 10:52:35 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v5 34/75] x86/head/64: Make fixup_pointer() static inline
Message-ID: <202007241052.1B5F51DB4@keescook>
References: <20200724160336.5435-1-joro@8bytes.org>
 <20200724160336.5435-35-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724160336.5435-35-joro@8bytes.org>
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

On Fri, Jul 24, 2020 at 06:02:55PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Also move it to a header file so that it can be used in the idt code
> to setup the early IDT.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
