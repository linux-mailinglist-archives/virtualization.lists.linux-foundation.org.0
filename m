Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0472201C3
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 03:24:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AB07389893;
	Wed, 15 Jul 2020 01:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ocdDCqcYXRkh; Wed, 15 Jul 2020 01:24:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 88891898A0;
	Wed, 15 Jul 2020 01:24:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62A4FC0733;
	Wed, 15 Jul 2020 01:24:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CDD2C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 46D39204EF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:24:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m0fnJzChV9yg
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:24:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 87F33204E1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:24:46 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id z3so652112pfn.12
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 18:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MV9eZ5OBgqTWIWwL9zpqkY6z/89bNn4vF0SnKjjFgTo=;
 b=As6jd7uWVm/c/uXeyIWNIkQkotsGzxOaaLvAOys2HbOeY1PyGOtFGLeOpMzbRY5fBW
 7CLyuBD/uXM+ETluLcq0AobqVWwAOu6WOxc9qIb+eJ501gis6a1t3VHFTz+mJN4Shyf5
 csynOX1q6Nqq6cA0TTETd6QbQtBcx5uQ7Pwsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MV9eZ5OBgqTWIWwL9zpqkY6z/89bNn4vF0SnKjjFgTo=;
 b=G42qtHLmCgppEOZ6goqz+5wF4CmmpYuZgbj3FRa+Aqlhqwu7siZFceotcbKb4J4Fpu
 QYRNQZ8v8cTyo3Q3GEE4anYhrSRWEmqr9cHi6bgAB51fTzepUZCLr0ud6/ohrGhLhFyM
 mlKG3OelwZQUArEkEbov1aDg1pYx1xSwbST85Zv/SPPOU+bkStbv4CWO/AHiHzOkr+hq
 hB+5NZpIePcNNXe0w43sFdGXZC6atSfxaLhr9X21OECkWg5aHjObpAPcWSAmAOZv4iqF
 q7pazKb98+edYHpx2QjVI9mYFFzxJcWSgu2nqo+otab3FFm0bZsFXZv1ewHfTFOER41s
 hOlA==
X-Gm-Message-State: AOAM531LRo5VeNGvB4/SQdpW04S5vVfQaL6QHdWNX8KuodPPuLCbyJ48
 XwP3jn6lNwDwQc+QXw6WSH+OlA==
X-Google-Smtp-Source: ABdhPJwhN14rx8PS3l05EEyiO5yiHoXuh4AV1aLnKEa+PDj1AyXl4Y90zwpN7OBuitZH9VRBWPYvoQ==
X-Received: by 2002:a63:eb52:: with SMTP id b18mr5523396pgk.434.1594776286032; 
 Tue, 14 Jul 2020 18:24:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z2sm328776pfq.67.2020.07.14.18.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 18:24:45 -0700 (PDT)
Date: Tue, 14 Jul 2020 18:24:44 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v4 17/75] x86/boot/compressed/64: Change
 add_identity_map() to take start and end
Message-ID: <202007141824.909CAE9EB@keescook>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-18-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714120917.11253-18-joro@8bytes.org>
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

On Tue, Jul 14, 2020 at 02:08:19PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Changing the function to take start and end as parameters instead of
> start and size simplifies the callers, which don't need to calculate
> the size if they already have start and end.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
