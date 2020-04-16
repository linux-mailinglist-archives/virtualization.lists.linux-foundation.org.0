Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 011641AB4E7
	for <lists.virtualization@lfdr.de>; Thu, 16 Apr 2020 02:53:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 19DC0833C6;
	Thu, 16 Apr 2020 00:53:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I63PY7LkOBnn; Thu, 16 Apr 2020 00:53:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 71B0C82507;
	Thu, 16 Apr 2020 00:53:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FB1AC0172;
	Thu, 16 Apr 2020 00:53:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7BA7DC0172
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 00:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6F4E420356
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 00:53:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GbgPQwGwLlH2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 00:53:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 928E420355
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 00:53:52 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id ca21so7288388edb.7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 17:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hzMDorCv1GZID9zsmGcg6OddhqYx722MVsuJ8PCoquU=;
 b=PQbQU4mx+Y47Kp0VmJmY4pdmkyIFeOBpm/PuEBSauBtddR5AErvLkCUxYdB5QBq+Bl
 hkSP5lJlqOjR6sKAAc+32Cg2e5kqRXpCMz9orUD/QAFTm2fIM2IpvXHQkVIn6FAEqQOR
 he4mBko7bQTN6Ponzq1pQyRnUmWxWkRdsyIqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hzMDorCv1GZID9zsmGcg6OddhqYx722MVsuJ8PCoquU=;
 b=CTB7nEHsjtErCf1x6yyUFMf8S2SwRcGSA97hOUxGJmpzYneNjIIseILPe8ATjRATxl
 6AGXq21iMNZ+87YEW/446Un/p2aaKweD0DGqEdIUA3azH4E1ehf1aI2elHAb2sjeZfx+
 K39Ti4tqa42PIGs0rroMPasXLVfkVSB8mP/WMooz8v7K8LXDY1/955oAqZpJzTPKVSgF
 kZG5DGpkYNCMmk4JBh4jbnIBqhrAPVRMHOuA6aFn4RYjD8/r8HJ8bTk4TkhOeQgIT/Nc
 p3tFdFJT+bTd1ilAoo7X6Yfakon/cxdmCPBrZD5B9CEYLxQG5/ClwHQe6kYJyBxxG9K2
 U9Vg==
X-Gm-Message-State: AGi0PuaVWZIfmv+M0ttlRsahbVpkNJTvgi+WbgRbE+cDuevfrB/j4f02
 4lfXzYaGtC1R2FXAvnMk9UHdSURpziKTiw==
X-Google-Smtp-Source: APiQypJY+JyJZok2dG+XBoKJQmf0GrahvD7wukJjpiW/cuTHlt+b/DzwLiJ214BcYHc/lp47R5nqww==
X-Received: by 2002:a50:a1e6:: with SMTP id 93mr28884493edk.172.1586998430583; 
 Wed, 15 Apr 2020 17:53:50 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com.
 [209.85.218.42])
 by smtp.gmail.com with ESMTPSA id l16sm2284864edv.71.2020.04.15.17.53.50
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 17:53:50 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id pg17so42778ejb.9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 17:53:50 -0700 (PDT)
X-Received: by 2002:a2e:870f:: with SMTP id m15mr4867889lji.16.1586998009252; 
 Wed, 15 Apr 2020 17:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200414123606-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200414123606-mutt-send-email-mst@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 Apr 2020 17:46:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgVQcD=JJVmowEorHHQSVmSw+vG+Ddc4FATZoTp9mfUmw@mail.gmail.com>
Message-ID: <CAHk-=wgVQcD=JJVmowEorHHQSVmSw+vG+Ddc4FATZoTp9mfUmw@mail.gmail.com>
Subject: Re: [GIT PULL] vhost: cleanups and fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: hulkci@huawei.com, matej.genci@nutanix.com, KVM list <kvm@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Netdev <netdev@vger.kernel.org>, yanaijie@huawei.com,
 YueHaibing <yuehaibing@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, ashutosh.dixit@intel.com,
 eperezma@redhat.com, Andy Shevchenko <andy.shevchenko@gmail.com>,
 eli@mellanox.com, Stephen Rothwell <sfr@canb.auug.org.au>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Markus Elfring <elfring@users.sourceforge.net>
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

On Tue, Apr 14, 2020 at 9:36 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> virtio: fixes, cleanups

Looking at this, about 75% of it looks like it should have come in
during the merge window, not now.

              Linus
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
