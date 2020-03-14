Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D0F185583
	for <lists.virtualization@lfdr.de>; Sat, 14 Mar 2020 11:59:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4235F8815B;
	Sat, 14 Mar 2020 10:59:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ol-PkWsOP2SJ; Sat, 14 Mar 2020 10:59:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8357E88270;
	Sat, 14 Mar 2020 10:59:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6399AC0177;
	Sat, 14 Mar 2020 10:59:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46CEDC0177
 for <virtualization@lists.linux-foundation.org>;
 Sat, 14 Mar 2020 10:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 30FD488269
 for <virtualization@lists.linux-foundation.org>;
 Sat, 14 Mar 2020 10:59:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7BWFFT8CRcAu
 for <virtualization@lists.linux-foundation.org>;
 Sat, 14 Mar 2020 10:59:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5A1368815B
 for <virtualization@lists.linux-foundation.org>;
 Sat, 14 Mar 2020 10:59:51 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id b21so4905415edy.9
 for <virtualization@lists.linux-foundation.org>;
 Sat, 14 Mar 2020 03:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=g01xlTcHoCeW8HA/Zoij0G1oenw325gwe1o5DluyjVk=;
 b=VcqV2LqUNLqiu/nF5Um/oTxErxgr8XRXJxMiax+yvzRr2/CH4S5TSpu78Evgl9MlKI
 HnDfZT24EKltwt+rQkjzVr2U2LaKBi1qlaiw/bRR/uGfR1kUMGke86Eslf+LNimsZJWm
 Xi52Ivkn161Jacsfg15tWPOS5bi2SEQ4ewD3cwhMlwz7WXZQz7o67cEVwZ7DXSuX6v5T
 5AHSPRGzmEyuBTy2dVwJin1c2aq8iUaCE0HOsjhcHqGsiH0onpUM/pZH2336WO7K5j/U
 /6D9ABX5jnCAxY20yXh3Wkp2IEjReUL7sqs6/24NGK/LcEtEMkIKeUq4nitgWtD9xDId
 YRnQ==
X-Gm-Message-State: ANhLgQ0m4gh7m+I2orCIOZ90hYCn7LPFSXys1Vc+MeolfY98gu/lq34E
 pj1ynERhyRYp5041C+huMiM=
X-Google-Smtp-Source: ADFU+vv1WkKB0u07WBdUm4ghC+dsxjEf7g/P9HdfFTe2RSYc3zQrfQ3xU1TFNHiCqZRBtceL52pXBQ==
X-Received: by 2002:a17:906:2181:: with SMTP id
 1mr15328632eju.131.1584183589584; 
 Sat, 14 Mar 2020 03:59:49 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
 by smtp.googlemail.com with ESMTPSA id f21sm1538993ejx.41.2020.03.14.03.59.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Mar 2020 03:59:48 -0700 (PDT)
Date: Sat, 14 Mar 2020 11:59:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [RESEND PATCH v2 6/9] drm/mgag200: Constify ioreadX() iomem
 argument (as in generic implementation)
Message-ID: <20200314105944.GA16044@kozik-lap>
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-7-krzk@kernel.org>
 <90baef2d-25fe-fac4-6a7e-b103b4b6721e@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <90baef2d-25fe-fac4-6a7e-b103b4b6721e@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-arch@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 linux-sh@vger.kernel.org, Alexey Brodkin <abrodkin@synopsys.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Nick Kossifidis <mickflemm@gmail.com>,
 Allen Hubbe <allenbh@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>,
 linux-media@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
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

On Thu, Mar 12, 2020 at 11:49:05AM +0100, Thomas Zimmermann wrote:
> Hi Krzysztof,
> 
> I just received a resend email from 3 weeks ago :/
> 
> Do you want me to merge the mgag200 patch into drm-misc-next?

Thanks but it depends on the first patch in the series so either it
could go with your ack through other tree or I will send it later (once
1st patch gets to mainline).


Best regards,
Krzysztof

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
