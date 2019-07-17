Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2176B4CA
	for <lists.virtualization@lfdr.de>; Wed, 17 Jul 2019 05:02:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AB1C2D8E;
	Wed, 17 Jul 2019 03:02:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CAE3DAD0
	for <virtualization@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 03:02:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 69B6F8A5
	for <virtualization@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 03:02:12 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id y20so7461435otk.7
	for <virtualization@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 20:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=moIcfOwT7Q28xvMfB1s79vLckwsn6mLmtlt9P80VoSI=;
	b=w7T5h8le8kar8GHbeuzqemVg7xntplejAU3LIpPoPxD5rDaA6mykcolHja7oxamFN+
	fcNJhXd4DetJySCJdhmgJKwbVMDKSXOWyUXGidrtJe3PTgBeA2og6iz5nw8EfAKyCAy6
	Zqj0eon0fp5aANLnzxF0AprfgdUTlPURq0NTh0A0VPAabeJKqJa0f82l0EF5e1m0pJmj
	OQjFnWnmI/ku6kLWxgppPmqjdvamNgPd3JVshYU1hb4KWI+pOcaeI0O2G+kPJcIYRliq
	M0SG+Nr6OPh0EAarDQanDv8ER7J0l7mWieCTBgxEmKozT8FVkUxiQXPrGbA2QGxio928
	qWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=moIcfOwT7Q28xvMfB1s79vLckwsn6mLmtlt9P80VoSI=;
	b=dpbtmhRXpKlqLyuPWYB3hP6/tTYlUT5Og52aOgiHiQfHaW15aTHFvx95KuPD5d3aUE
	Wiijx1fjpPh58JJed05ompFH35MQb65hLuXsjW06xF0+swdrnGcpIUhJjyQ9teXY5K0z
	RJPY95Eps6x7qPeGezGywvY8dj4t9nGlzRt1jcUwJLOKes28m/pu8klLD4x2BgGKwwLg
	oMQf4BQujQrbtdtkR8Pmz/YOI8Rpac2/fbGwG6QdMFw39U78IO22EVQNIMpd4dMpeMbQ
	E4uCUIyjr2FUBPcU+Vw7qu2/KQBGz6d88vuVrMXWsl5Jngl0nW+OinY8RI+x9n1F72ln
	Au8w==
X-Gm-Message-State: APjAAAVxmQbumbRCU31FpvME8a4JymHY0kxUtBZmSEAocid0gW1IlJH4
	6v8YpQyd7E2xDMzfSVkxWJqX7P0dV63HAYHhDjrN3w==
X-Google-Smtp-Source: APXvYqzJ8IMG8VXWy0kEMM/37hXScWIxxaMIJc4srMPsvxzwSqtji4irKjrqrN/DKpO/rDeJRWuz85fCgkFPrES4iVg=
X-Received: by 2002:a9d:470d:: with SMTP id a13mr26992706otf.126.1563332531714;
	Tue, 16 Jul 2019 20:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190712051610.15478-1-pagupta@redhat.com>
	<20190712101021-mutt-send-email-mst@kernel.org>
In-Reply-To: <20190712101021-mutt-send-email-mst@kernel.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 16 Jul 2019 20:02:00 -0700
Message-ID: <CAPcyv4joSgj7ok4DfW3tWQGavRDP8kp7oQRH8DgkG=0eWgNn1g@mail.gmail.com>
Subject: Re: [PATCH v3] virtio_pmem: fix sparse warning
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Pankaj Gupta <pagupta@redhat.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
	Cornelia Huck <cohuck@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	yuval shaia <yuval.shaia@oracle.com>,
	virtualization@lists.linux-foundation.org, lcapitulino@redhat.com
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

On Fri, Jul 12, 2019 at 7:11 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Jul 12, 2019 at 10:46:10AM +0530, Pankaj Gupta wrote:
> > This patch fixes below sparse warning related to __virtio
> > type in virtio pmem driver. This is reported by Intel test
> > bot on linux-next tree.
> >
> > nd_virtio.c:56:28: warning: incorrect type in assignment
> >                                 (different base types)
> > nd_virtio.c:56:28:    expected unsigned int [unsigned] [usertype] type
> > nd_virtio.c:56:28:    got restricted __virtio32
> > nd_virtio.c:93:59: warning: incorrect type in argument 2
> >                                 (different base types)
> > nd_virtio.c:93:59:    expected restricted __virtio32 [usertype] val
> > nd_virtio.c:93:59:    got unsigned int [unsigned] [usertype] ret
> >
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>
> Pls merge - I assume nvdimm tree?

Yes, I'll push this with the rest to Linus tomorrow morning.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
