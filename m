Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BB421216F
	for <lists.virtualization@lfdr.de>; Thu,  2 Jul 2020 12:36:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A943189072;
	Thu,  2 Jul 2020 10:36:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QH3Hv7aBwDxz; Thu,  2 Jul 2020 10:36:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4C0A68909F;
	Thu,  2 Jul 2020 10:36:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33FB4C0733;
	Thu,  2 Jul 2020 10:36:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADBEDC0733
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 10:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AA4FC89057
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 10:36:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SmHrjqmJ7UDt
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 10:36:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2AF0A878E7
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 10:36:34 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id x72so2937659pfc.6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Jul 2020 03:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=zjqH5OyJ0uNgtW+k6QC+tgZu9cOQCPtDoHSfO1sMDg4=;
 b=gKLSXxs5Xi0ffOI4xaSGtq2l4qx855x5dafTHDq9WcXO7TQYplArFpssod2qR5iroc
 Z//J/E+Jxf2dWCBbYKBHXFVD+w+CXtshhKTHJdbD/O3iC89Fj08aafiZCVEJF2cOTrNE
 4O5RqYQhri/vkSqkCRh9y8WiBO96ojL+4z4rqkLZXntWV5WAPiQZgcI1l0fnRFTFW50B
 rnTXdlfNOfTTwQ8ZKKGlQmHh4n8MfQVtn/MOtzbdTacVyDrkzZeO+Bdvyer8wuGkuL/S
 WC2gdd9tZnGshLR1E2a6JkZgt2oEw8jXurog9U4CI9OV0MLCeiLynDz8keltOuHYW5qY
 QHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=zjqH5OyJ0uNgtW+k6QC+tgZu9cOQCPtDoHSfO1sMDg4=;
 b=NiDBbYS7ZzSOa50bejT/5YhMpRAC1Oljd9W0J33qdK7sKNyIjSOc/4nLibtdoCx/Va
 4Bzghn+oIVEJQl+kjn3L5qcsaaV6/WywysheK2UwhMJJRWlhLoj931Zgx29JO45IqeKW
 1S638ZTSuRSmNqQ4DAJoe91Yd0NAy8iWkhwqfB3ukWtGRM5nXHG/XOt/DdPntU/GxqH8
 h9tOLIbA0nPXjLjKjiBdJ4Xfo+AhmeC0F11ZmXqH9+3Kdd8SOZaWLVvCEv6ez/9aykFo
 nAmdqfHg23S3EQI68jN6f/HyX/R319xks+nYZtZlGYlbHbP/h4vjv/LNQzcwtji9MKv3
 R8LQ==
X-Gm-Message-State: AOAM532UBDklKOve0ebA+ZhoPUQsmAe4iAJJKBi9ptPcQtP3/u2d9kvn
 RsKf467zfp5kbeDuJ/E7jOY=
X-Google-Smtp-Source: ABdhPJzDNFrzM9gHS1aXVkfvYMpILRrQRmwBPh5wcimghMwI/lqsx8PhEr//gfgskebXTyEDOTJ33g==
X-Received: by 2002:a63:8f18:: with SMTP id n24mr23072639pgd.432.1593686193761; 
 Thu, 02 Jul 2020 03:36:33 -0700 (PDT)
Received: from localhost (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id i128sm8838706pfe.74.2020.07.02.03.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 03:36:33 -0700 (PDT)
Date: Thu, 02 Jul 2020 20:36:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/8] powerpc/pseries: use smp_rmb() in H_CONFER spin yield
To: Peter Zijlstra <peterz@infradead.org>
References: <20200702074839.1057733-1-npiggin@gmail.com>
 <20200702074839.1057733-3-npiggin@gmail.com>
 <20200702082840.GC4781@hirez.programming.kicks-ass.net>
In-Reply-To: <20200702082840.GC4781@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Message-Id: <1593685552.uh4kepm08t.astroid@bobo.none>
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Anton Blanchard <anton@ozlabs.org>, linuxppc-dev@lists.ozlabs.org
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

Excerpts from Peter Zijlstra's message of July 2, 2020 6:28 pm:
> On Thu, Jul 02, 2020 at 05:48:33PM +1000, Nicholas Piggin wrote:
>> There is no need for rmb(), this allows faster lwsync here.
> 
> Since you determined this; I'm thinking you actually understand the
> ordering here. How about recording this understanding in a comment?
> 
> Also, should the lock->slock load not use READ_ONCE() ?

Yeah, good point. Maybe I'll drop it from this series, doesn't really 
belong I just saw the cleanup and didn't want to forget it.

We we just ordering the two loads in this function, and !SMP isn't a 
concern (i.e., no issues of !SMP guest on SMP HV), but yeah fixing
the lack of comment is warranted, thanks.

Thanks,
Nick
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
