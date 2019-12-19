Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F30E4126758
	for <lists.virtualization@lfdr.de>; Thu, 19 Dec 2019 17:43:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A6BE986FD3;
	Thu, 19 Dec 2019 16:43:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QHrULdLOOpYk; Thu, 19 Dec 2019 16:43:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C196586FEC;
	Thu, 19 Dec 2019 16:43:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A03EDC077D;
	Thu, 19 Dec 2019 16:43:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB48AC077D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Dec 2019 16:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A7C3386FD3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Dec 2019 16:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2raOMAY7YiVs
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Dec 2019 16:43:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D954B86FCD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Dec 2019 16:43:50 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id f8so5539879edv.2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Dec 2019 08:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q6MJKY5kaJhdcPD2Yij+K4j3QBznO/FzqxPRwZHg2tA=;
 b=XYNY/1juioQpuXWDwItjvluLKzqTb1s+LUDJh70eT+FynV6pmhNjrfR8rKpTN0Y4Vq
 95LNMIm35iIung4zroafpJpZMFHIQW6gyl0nMe0sXzlo0Usj/osB8dJgXFazZDihbiKk
 TXHN/eqPdNOFXyC7+ATLgVoMdiY/9k9+NozPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q6MJKY5kaJhdcPD2Yij+K4j3QBznO/FzqxPRwZHg2tA=;
 b=BfaKWvDaD3vi2/dWekSD80nSaQTgNFI+5J29X2gaSqTPc9BxnONS/Kz8KMKa43By7+
 NwE4GmAsiq7DExl+PjmScKKeFakxSxInlLhZin74cJ/8GuJ82uPieKD8znZij5VRC06U
 dIOE6v5xQVxLzRoRkIYaJrTKtrJs3sWOVzLGXrssyee4z/aXy0+ZwGXHOfuP80DN8f/q
 XfwnPNoygtcD56HPcqpkWAeGtoa8HuX2Y8k891xyg/xgbkNF+s6Q8hW2E8ERAhYE1BF1
 X78IZ6MmU54JJ21Qw9dR3kuuPw6VS/I3WH89snXDPnQsCAhb4H4hc0/XvZfPNE39h61a
 pWHw==
X-Gm-Message-State: APjAAAV7TFqiR8Pfjy+pOBX1dtcQFBDyaWsvNZeru0g7UPWVFZziEeIK
 9QcMd5GKXNoT5kBNNOAeGqgbkyeo8Xw=
X-Google-Smtp-Source: APXvYqzXNWjrHlyhfrSGD6PkTt/O1cfpUjis5wp4R/PCwNs3HMhz+zFOySb1126Zr2uV8vcA/OfbIQ==
X-Received: by 2002:aa7:df09:: with SMTP id c9mr10336421edy.133.1576773829139; 
 Thu, 19 Dec 2019 08:43:49 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44])
 by smtp.gmail.com with ESMTPSA id s19sm531006edr.55.2019.12.19.08.43.48
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2019 08:43:48 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id j42so6629462wrj.12
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Dec 2019 08:43:48 -0800 (PST)
X-Received: by 2002:adf:ee92:: with SMTP id b18mr10865736wro.281.1576773336863; 
 Thu, 19 Dec 2019 08:35:36 -0800 (PST)
MIME-Version: 1.0
References: <20191205000957.112719-1-thgarnie@chromium.org>
 <20191219133452.GM2827@hirez.programming.kicks-ass.net>
In-Reply-To: <20191219133452.GM2827@hirez.programming.kicks-ass.net>
From: Thomas Garnier <thgarnie@chromium.org>
Date: Thu, 19 Dec 2019 08:35:25 -0800
X-Gmail-Original-Message-ID: <CAJcbSZEubkFN0BLugoBm8fsPrNWxfFCDytC3nYUepr74dQFS=w@mail.gmail.com>
Message-ID: <CAJcbSZEubkFN0BLugoBm8fsPrNWxfFCDytC3nYUepr74dQFS=w@mail.gmail.com>
Subject: Re: [PATCH v10 00/11] x86: PIE support to extend KASLR randomization
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kristen Carlson Accardi <kristen@linux.intel.com>,
 Kernel Hardening <kernel-hardening@lists.openwall.com>, "VMware,
 Inc." <pv-drivers@vmware.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 virtualization@lists.linux-foundation.org, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, Jiri Slaby <jslaby@suse.cz>,
 Thomas Gleixner <tglx@linutronix.de>, Thomas Hellstrom <thellstrom@vmware.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Will Deacon <will@kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Len Brown <len.brown@intel.com>, Kees Cook <keescook@chromium.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Alexios Zavras <alexios.zavras@intel.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Allison Randal <allison@lohutok.net>, Juergen Gross <jgross@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
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

On Thu, Dec 19, 2019 at 5:35 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Dec 04, 2019 at 04:09:37PM -0800, Thomas Garnier wrote:
> > Minor changes based on feedback and rebase from v9.
> >
> > Splitting the previous serie in two. This part contains assembly code
> > changes required for PIE but without any direct dependencies with the
> > rest of the patchset.
>
> ISTR suggestion you add an objtool pass that verifies there are no
> absolute text references left. Otherwise we'll forever be chasing that
> last one..

Correct, I have a reference in the changelog saying I will tackle in
the next patchset because we still have non-pie references in other
places but the fix is a bit more complex (for exemple per-cpu) and not
included in this phase. I will add a better explanation in the next
message for patch v11.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
