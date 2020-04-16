Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0181C1ACE38
	for <lists.virtualization@lfdr.de>; Thu, 16 Apr 2020 19:02:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 70839861EE;
	Thu, 16 Apr 2020 17:02:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XZ16zix1WSvh; Thu, 16 Apr 2020 17:02:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1AA2B861F1;
	Thu, 16 Apr 2020 17:02:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E667EC0172;
	Thu, 16 Apr 2020 17:02:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3AC51C0172
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 17:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1CBDB87591
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 17:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EmQ16xmXXbcd
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 17:02:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2A64D8758F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 17:02:13 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id r17so6159492lff.2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 10:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dDes2+uYwqdDpp6u8TFEa/zLM2coaSYzbk9Klu5JF50=;
 b=d4bGcI6r9EXx896lm5psS0z1tGPVAD1Aq/Ppvu5hGlzAbh+Zf/1v3KrwUBex7wJOqX
 fdBbg7Y0d06giLFwxcJ/M+yzoOCnSc92Ma3Vx8FQSeIFEJ9t0tWAkPjyb2FW9WP2SOBk
 +rtsc0ysltydTupDTjzTBovmcsnwzBPYrog24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dDes2+uYwqdDpp6u8TFEa/zLM2coaSYzbk9Klu5JF50=;
 b=U3cWIbGmgZ7pXDg3aUmdxBsdqwxXFyyQ5yvr2T2boBU8SVgv0g+0WYv9YPu+h+o4k7
 kqAejvCqurPPdM8m1bLzAc3ua1WRmC0gENhHqLICydfL51ZNseE0PybBB8tcuDnhc8ik
 4/QO0mXsRrQQEFCYGVhs6K/g3mOaOcQTk3LWutrjsvFoiSwunOjz3KPCHyLw/hPEYY+i
 tCvnwlzwFdjIUaoPcBJkJY1W701LWCxwHgipnmhhKIwh0UjbA6lPMkFSNLoR8csuJGei
 etRC69W6DEWVtb291H67JdQOqaV1JupDQbAIxsGcFNtAUEt/xEfTDQhGuklgEPocQDHP
 n3mQ==
X-Gm-Message-State: AGi0PuaDkciqhTBNmAb6iGk8N6BWj7DmziSPQ9ppUBYfV6igjP+0k24U
 a8PZpuUumvZzxCKn27yMHLQ5hmHKKV6wWg==
X-Google-Smtp-Source: APiQypI8+O7E73s1+8MKW4UAjSTcEYTUlIKjeqOB9IURX5JLxy1CdFWWTRsRodH/oorI6OkhXhhhcg==
X-Received: by 2002:ac2:528f:: with SMTP id q15mr6938398lfm.132.1587056529983; 
 Thu, 16 Apr 2020 10:02:09 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174])
 by smtp.gmail.com with ESMTPSA id v12sm10086238ljd.85.2020.04.16.10.02.08
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2020 10:02:08 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id z26so8551682ljz.11
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 10:02:08 -0700 (PDT)
X-Received: by 2002:a2e:7c1a:: with SMTP id x26mr6539997ljc.209.1587056528034; 
 Thu, 16 Apr 2020 10:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200414123606-mutt-send-email-mst@kernel.org>
 <CAHk-=wgVQcD=JJVmowEorHHQSVmSw+vG+Ddc4FATZoTp9mfUmw@mail.gmail.com>
 <20200416081330-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200416081330-mutt-send-email-mst@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 16 Apr 2020 10:01:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjduPCAE-sr_XLUdExupiL0bOU5GBfpMd32cqMC-VVxeg@mail.gmail.com>
Message-ID: <CAHk-=wjduPCAE-sr_XLUdExupiL0bOU5GBfpMd32cqMC-VVxeg@mail.gmail.com>
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

On Thu, Apr 16, 2020 at 5:20 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> Well it's all just fallout from

What? No. Half of it seems to be the moving of "struct vring" around
to other headers and stuff.

And then that is done very confusingly too, using two different
structures both called "struct vring".

No way can I pull that kind of craziness as a "fix".

                Linus
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
