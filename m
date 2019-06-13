Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F2809435C2
	for <lists.virtualization@lfdr.de>; Thu, 13 Jun 2019 14:12:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 38554E1B;
	Thu, 13 Jun 2019 12:12:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 02277DD4
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 12:12:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E0F6563D
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 12:12:04 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id e5so16309453iok.4
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 05:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6TnqYw+JH0yXL0cYBb0DT/5cCjybbJ0FkJFzKrPy/Ks=;
	b=V1kObx8WFKLXYMLDacaZYfPCx7cuX/IA1LFq0ZQgLWAhg1D+voGEfUagJ645qIod/k
	zGsXPiqk/Lqd34ObQupyesy1ZWwYRn4JJgZYrUNAhinntdvRuvv/WKGNUQ1CzGo77vZI
	HP27MV24tXmnPjITSM4yW0sUzQZ0bjDFAppf0fVDVLoyoOZEhMRz+m/JrdY2DmbhjqaB
	/fj1ntsBGZHDRJj9F2KyBisjtbnbm1G19+nfPG0p3m1qvVVNLMemEyuCeVdMA0IngggG
	vBjhGKmCmQKU4bEJ3/jtx+XCZqrxXvoxyG9f3sF4nQUxGgJ+AV93Oh/GUr/cB65beXrU
	IHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6TnqYw+JH0yXL0cYBb0DT/5cCjybbJ0FkJFzKrPy/Ks=;
	b=VSYUxVw4CeW9Na52Q8hbY8DJT7RFxsty1KH1oaMd0haCAMIdd8If4+NJQEabFHC2rW
	aM/r2ldTRVS/SnGXGPKpAt7YsMLMQbfuJk37SnX1D7bY7cw8R/Gj4wj1A1Y4AQj8zu0r
	qSFOU/N2LxVrZi+RB+spbC9a5wxY8AkxbOZZREYsyO76xZ5sih3J+PWgTXw6ikn/lzAh
	lFvGSmIojmAJa/niS0/qgi45VAAGUkmAFHBGe7zbsDoOJCBQEpMFD4pOAboaWmF+Ba2F
	t7JnKraMBHSj+fXeVCeMxyer95Tz4gGaSe01K42szPRvhl/6ylA3FtIN45ZicdmPoFCS
	Cmyg==
X-Gm-Message-State: APjAAAVSpTTjz6tfx8FaOkE8ThObJX/AgyHhOHVHrw/X0BjyACNuC7ej
	nGrOvx2MKaGZsYUD2e1bU5TtQjb/KZlGh4sMVQn4Lg==
X-Google-Smtp-Source: APXvYqyCTIGH2L4bZDuCnup/5Krt+juZXVarS330yujDiKA6yKNS0mtgMz1H4aP3TlXSLRHvxmG6k/hJzd4683l6yRQ=
X-Received: by 2002:a6b:fb0f:: with SMTP id h15mr3118490iog.266.1560427923857; 
	Thu, 13 Jun 2019 05:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190613120659.10680-1-hdanton@sina.com>
In-Reply-To: <20190613120659.10680-1-hdanton@sina.com>
Date: Thu, 13 Jun 2019 14:11:52 +0200
Message-ID: <CACT4Y+ZaoM4c739MM5KXH7K0_oeRsQ8F4Erptv8bjbx0JFuS-w@mail.gmail.com>
Subject: Re: memory leak in vhost_net_ioctl
To: Hillf Danton <hdanton@sina.com>
X-Spam-Status: No, score=-9.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
	"jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
	"hawk@kernel.org" <hawk@kernel.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>,
	"mst@redhat.com" <mst@redhat.com>,
	syzbot <syzbot+0789f0c7e45efd7bb643@syzkaller.appspotmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>,
	"ast@kernel.org" <ast@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"davem@davemloft.net" <davem@davemloft.net>
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
From: Dmitry Vyukov via Virtualization
	<virtualization@lists.linux-foundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Thu, Jun 13, 2019 at 2:07 PM Hillf Danton <hdanton@sina.com> wrote:
>
>
> Hello Jason
>
> On Thu, 13 Jun 2019 17:10:39 +0800 Jason Wang wrote:
> >
> > This is basically a kfree(ubuf) after the second vhost_net_flush() in
> > vhost_net_release().
> >
> Fairly good catch.
>
> > Could you please post a formal patch?
> >
> I'd like very much to do that; but I wont, I am afraid, until I collect a
> Tested-by because of reproducer without a cutting edge.

You can easily collect Tested-by from syzbot for any bug with a reproducer ;)
https://github.com/google/syzkaller/blob/master/docs/syzbot.md#testing-patches
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
