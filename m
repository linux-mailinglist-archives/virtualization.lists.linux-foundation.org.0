Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A26977385
	for <lists.virtualization@lfdr.de>; Fri, 26 Jul 2019 23:35:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 30A71DAC;
	Fri, 26 Jul 2019 21:35:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4C295DA6
	for <virtualization@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 21:35:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AF36E894
	for <virtualization@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 21:35:44 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id r9so52802366ljg.5
	for <virtualization@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 14:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cVmcZwFhu0VmRu42g2oqdHVRFxqVWleFTBghf3PdU0s=;
	b=auPaSao4Pu92MrHcL8ri0lwhHW+MxKtMjV1DpxAsA7pVZXiYOWxWxhMCN+yWqE/ApM
	N1RAQkb6zmoRJMBukop8ckoCwrxu+fdsXpdHaXZqjEngnR6ahHT+uJi/+bo3yEWp6UbC
	NE3E48fT2I4XCRhysWOc0g0KiUbHZXwqDqq8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cVmcZwFhu0VmRu42g2oqdHVRFxqVWleFTBghf3PdU0s=;
	b=a83FdyB0SaFiiHuAKEcF8aMDIAnERNIgCzpZYF8F3lCYdTqwpCXObGYHSgsRrYOcUe
	Ts6+MglWmvZ/sng3QCzIELCAPhjU+QWaHG471eKip0NExYJfHf2PhnzFwhaB6eQ7bxwx
	25y8rz1DDgsFSrLTo3dSexCIrGPG5g9zPmhyemZ16NdHu9Gw8TLxFZlfk33J2IxhUNxO
	vnB/n1gYHTpIJj6mSJxvPEzE0ZDANMayxRYN9+o8l9NlTYXk2CuC3CzPFPMeXQP8/sgV
	u+1YntQmvCB9yVZ5ZkuHUdPTyuO58zKoZuEneZfSMvSeM+24OBpywA7sk0ONj77VTuC0
	oiEg==
X-Gm-Message-State: APjAAAXRtf5f42AI+k5uJaP8kD6q2r+fnlKMRGft8ajRmT9ZoOGvvao+
	WXKwc+C/+K2Vsj3oLL7Ics7bJFpjjhljQw==
X-Google-Smtp-Source: APXvYqw7VWL4AMqrNp3x+W6nJpczskdrjWdWMSjFpnL7VD8qtPXDHAlYyDa0QgU3zZbklRci/kuSww==
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr10736900ljj.185.1564176942365; 
	Fri, 26 Jul 2019 14:35:42 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
	[209.85.208.181])
	by smtp.gmail.com with ESMTPSA id n1sm8725061lfk.19.2019.07.26.14.35.41
	for <virtualization@lists.linux-foundation.org>
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Jul 2019 14:35:41 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id x25so52874241ljh.2
	for <virtualization@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 14:35:41 -0700 (PDT)
X-Received: by 2002:a2e:b003:: with SMTP id y3mr51555432ljk.72.1564176941127; 
	Fri, 26 Jul 2019 14:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000b4358f058e924c6d@google.com>
	<000000000000e87d14058e9728d7@google.com>
In-Reply-To: <000000000000e87d14058e9728d7@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 26 Jul 2019 14:35:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=whnM5+FBJuVoxXELvFgecuc0+vW7ibWy4Gc5qJbW8HL2Q@mail.gmail.com>
Message-ID: <CAHk-=whnM5+FBJuVoxXELvFgecuc0+vW7ibWy4Gc5qJbW8HL2Q@mail.gmail.com>
Subject: Re: INFO: rcu detected stall in vhost_worker
To: syzbot <syzbot+36e93b425cd6eb54fcc1@syzkaller.appspotmail.com>
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED, RCVD_IN_DNSWL_NONE,
	SORTED_RECIPS autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: michal.lkml@markovi.net, KVM list <kvm@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Netdev <netdev@vger.kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
	virtualization@lists.linux-foundation.org,
	Masahiro Yamada <yamada.masahiro@socionext.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Fri, Jul 26, 2019 at 8:26 AM syzbot
<syzbot+36e93b425cd6eb54fcc1@syzkaller.appspotmail.com> wrote:
>
> syzbot has bisected this bug to:
>
> commit 0ecfebd2b52404ae0c54a878c872bb93363ada36
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Jul 7 22:41:56 2019 +0000
>
>      Linux 5.2

That seems very unlikely. That commit literally just changes the
EXTRAVERSION part of the version string.

So even if something actually depended on the version number, even
that wouldn't have triggered any semantic change.

              Linus
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
