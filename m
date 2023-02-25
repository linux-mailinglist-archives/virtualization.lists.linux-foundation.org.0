Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF166A2B8A
	for <lists.virtualization@lfdr.de>; Sat, 25 Feb 2023 20:49:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D20A0813C0;
	Sat, 25 Feb 2023 19:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D20A0813C0
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=ZxiqbkUq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o3-D1dCU8GQI; Sat, 25 Feb 2023 19:49:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 79411813B3;
	Sat, 25 Feb 2023 19:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79411813B3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C24B9C0078;
	Sat, 25 Feb 2023 19:49:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CAE7DC002B
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Feb 2023 19:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EE244157B
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Feb 2023 19:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EE244157B
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux-foundation.org
 header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google
 header.b=ZxiqbkUq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6DUWdX03W5ym
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Feb 2023 19:49:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACB9341575
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACB9341575
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Feb 2023 19:49:48 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id n2so3407068lfb.12
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Feb 2023 11:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FQ06yesyUgRY5DSL1h615Nm6fkq1Vhy1HsTju3YI3UI=;
 b=ZxiqbkUqEBDW1KNccJkKK7LUehWcaHJqIx3XuFbnY0uj4GN7vGXNoMgM5/cavjr+eG
 S2Kis6MUPpPXHH77SUCKr0RJ+zmzrUB7pGcj7cYvyAVN8DMoK0njiV/r8E4ayS2IIvv3
 BpeF5BTztR59OOV/oLZdOZU6cfSr1Q6W0MNXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FQ06yesyUgRY5DSL1h615Nm6fkq1Vhy1HsTju3YI3UI=;
 b=lm7/7lBF1pAPnLDUuYQn+GqPm/3Z4dKskPGUyrzgMXm89j59bRaRdQulhehtFHiAhl
 hSEHBgj5PPaCVzYEyI1ck7i77sCD61oRqMKe80KZX3D/F5QtP4pMK54HSh0WwvwXXJzd
 5uyOrwjJ/wzw4uu2GHn6FTKSQJPwEAs8Ggd7He6q15Ig9x6jCdrkpPfN98b4jsvAdxjP
 7cjTzCIZZTDLgAH/3CUv4wUl4Se1o/MN8IgXeP7bpzxOlwBKjxeJTfqEec410M1b5bAF
 9jOonmUxFecysVgPSi6lj9nnu90MMi+DJeo7R5N9ZVEhM9KIJ69DzveYS46bNF9Wha+D
 GbJg==
X-Gm-Message-State: AO0yUKXF58D43awH/Mf6nMxlIthZiwldOLrGX7O2sr+m++LdVJfPSnpp
 SsdrJwWFFZE/ZuyGvzAvTXWNGX2QyODySAS/uQV010xa
X-Google-Smtp-Source: AK7set+8N0cjsHThWgzMIzkMFEKGapzVn3vwekhE+tjWYUPakap1UXiO9stJjkJUlqI/7cAP4VnSVw==
X-Received: by 2002:ac2:4a75:0:b0:4dc:84c2:96f1 with SMTP id
 q21-20020ac24a75000000b004dc84c296f1mr6700696lfp.22.1677354586348; 
 Sat, 25 Feb 2023 11:49:46 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174]) by smtp.gmail.com with ESMTPSA id
 h17-20020ac250d1000000b004db3aa3c542sm287558lfm.47.2023.02.25.11.49.46
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 11:49:46 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id h3so2449895lja.12
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Feb 2023 11:49:46 -0800 (PST)
X-Received: by 2002:a17:907:60cd:b0:8f5:2e0e:6dc5 with SMTP id
 hv13-20020a17090760cd00b008f52e0e6dc5mr2490334ejc.0.1677354173776; Sat, 25
 Feb 2023 11:42:53 -0800 (PST)
MIME-Version: 1.0
References: <20230220194045-mutt-send-email-mst@kernel.org>
 <20230223020356-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230223020356-mutt-send-email-mst@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 25 Feb 2023 11:42:36 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg-az1yPKQmmDMnTMdUrg8hLzPUiUtUQu9d2EbdquBOnQ@mail.gmail.com>
Message-ID: <CAHk-=wg-az1yPKQmmDMnTMdUrg8hLzPUiUtUQu9d2EbdquBOnQ@mail.gmail.com>
Subject: Re: [GIT PULL] virtio,vhost,vdpa: features, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 stable@vger.kernel.org, bagasdotme@gmail.com, elic@nvidia.com,
 zyytlz.wz@163.com, hch@lst.de, m.szyprowski@samsung.com,
 almasrymina@google.com, sfr@canb.auug.org.au, anders.roxell@linaro.org,
 eperezma@redhat.com, liubo03@inspur.com, yangyingliang@huawei.com,
 lkft@linaro.org, colin.i.king@gmail.com, kangjie.xu@linux.alibaba.com,
 sammler@google.com, leiyang@redhat.com, bhelgaas@google.com,
 suwan.kim027@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 liming.wu@jaguarmicro.com, dmitry.fomichev@wdc.com, sebastien.boeuf@intel.com,
 mie@igel.co.jp
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

On Wed, Feb 22, 2023 at 11:06 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> Did I muck this one up?  Pls let me know and maybe I can fix it up
> before the merge window closes.

No much-ups, I've just been merging other things, and came back to
architectures updates and virtualization now, so it's next in my
queue.

           Linus
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
