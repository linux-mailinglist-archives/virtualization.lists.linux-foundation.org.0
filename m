Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4CE158820
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 03:08:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 237C88538A;
	Tue, 11 Feb 2020 02:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0z5HcFVD-biJ; Tue, 11 Feb 2020 02:07:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8FC2E85308;
	Tue, 11 Feb 2020 02:07:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72989C07FE;
	Tue, 11 Feb 2020 02:07:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B098C07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 02:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 82BDE861A3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 02:07:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fxl8I-5Wuqzz
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 02:07:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 223EC811CF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 02:07:55 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id a13so9727438ljm.10
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 18:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ZmktFtWuNRr4MBQJWn7k52Pxjy+kjDuDMoIZxcgghA=;
 b=JShucc8r6D0hpeQT1Nnrm1g5ANmN7Qo/kC9ja9eYheqbwRWtW6iBI7iAF7MqgaTDXe
 EhrqvIPUINQoMoQ8goy1qNA3ZRXhiyGuval5jBA1G2OdAVfZKMH31Bd7+08ReOWRrocf
 QaEnZGmB7acwDOJTWolplby3wrYLVP5sMqcdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ZmktFtWuNRr4MBQJWn7k52Pxjy+kjDuDMoIZxcgghA=;
 b=Qfu/YoC4e6vxnU9ZkH8npUUSpJyCcy5o8f/StMb3xCtTeMz3+zoRRvVNFD4qdSFiPd
 Pc9n3vH58jniLeLHtB1ELyfopjU7jZpHA/OHj0ibd/ErDU4NYCEOqQjCejWTxjxwvqug
 fn0cdo2mJL/f80xmesDuaovtuTUuokHBcfGEMkOo0MZbwTMDtZkLjkR7coMWFcywgz7x
 nZP4Hyv8S1QAzhhkuQUbVC7LFiYhFKIZyxhQzvqzGfOdJzGBqaNZcKRviir1blyk3hh2
 a4PCdHJZIDbvr9JdIithcu2P4gB8/CFTvtATIDvFJueZIFmNpCHc8Q1S+0Dzb2GkpKVF
 gyRQ==
X-Gm-Message-State: APjAAAX5ptMYFWxtjSe/DfsiBmzpWCFBIW/X68pts/N6bS+RkIo2V74X
 kzD+b1xWu9ddBmuMmJjlBnt3INA1Bac1iw==
X-Google-Smtp-Source: APXvYqwGyvZ7DaPodWb4D5zTFWbyiFtMgkenm6TCcwK3fmrI5tahM6fP1uSPvjAMYQrYeWtbvHLlEQ==
X-Received: by 2002:a05:651c:1049:: with SMTP id
 x9mr2736493ljm.233.1581386872643; 
 Mon, 10 Feb 2020 18:07:52 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169])
 by smtp.gmail.com with ESMTPSA id q24sm891416lfm.78.2020.02.10.18.07.51
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2020 18:07:51 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id d10so9741609ljl.9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 18:07:51 -0800 (PST)
X-Received: by 2002:a2e:97cc:: with SMTP id m12mr2637598ljj.241.1581386871172; 
 Mon, 10 Feb 2020 18:07:51 -0800 (PST)
MIME-Version: 1.0
References: <20200210010252-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200210010252-mutt-send-email-mst@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 10 Feb 2020 18:07:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=whvPamkPZCyeERbgvmyWhJZhdt37G3ycaeRZgOo1bpVVw@mail.gmail.com>
Message-ID: <CAHk-=whvPamkPZCyeERbgvmyWhJZhdt37G3ycaeRZgOo1bpVVw@mail.gmail.com>
Subject: Re: [PULL] vhost: cleanups and fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Netdev <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 KVM list <kvm@vger.kernel.org>, virtualization@lists.linux-foundation.org
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

On Sun, Feb 9, 2020 at 10:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

Hmm? Pull request re-send? This already got merged on Friday as commit
e0f121c5cc2c, as far as I can tell.

It looks like the pr-tracker-bot didn't reply to that old email. Maybe
because the subject line only says "PULL", not "GIT PULL". But more
likely because it looks like lore.kernel.org doesn't have a record of
that email at all.

You might want to check your email settings. You have some odd headers
(including a completely broken name that has "Cc:" in it in the "To:"
field).

               Linus
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
