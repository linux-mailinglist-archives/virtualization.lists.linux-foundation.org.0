Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 859D5A631C
	for <lists.virtualization@lfdr.de>; Tue,  3 Sep 2019 09:52:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B581BCA8;
	Tue,  3 Sep 2019 07:52:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 75C61C9A
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 07:52:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 60F46709
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 07:52:31 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
	[209.85.222.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D742BC04BD33
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 07:52:30 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id o133so18222423qke.4
	for <virtualization@lists.linux-foundation.org>;
	Tue, 03 Sep 2019 00:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=xgXUEt0EG11zEupkHnOGVQFJLT+xonOin/Bks/3F7us=;
	b=LLSF9qA6HkQUrPcb4w1CWukOijC4UB/gczINoYsR3lKHCP7FaMpU6VX4aohb0wKXQU
	c0hk8dvOlp6YfFk1xm8bgvXYRCgzTV9xXJJt5VVfqVma8JOvI4kHZmK3B0wN/3krJ0W/
	3nnuqFFaOVWmFPciJZ3UWnhr3d4+QRJOJDmwBeA9bpfYsVQ2ufPJk9fN3UJ84Qo1BK0I
	y7W2slmlo2gtbwZGlMoTJRzQz5abu2etay+1N28cRppGvvKqbZ9/uRnhnqMjns51MiCv
	QKPpFeKPkdf848VuePMJu6JvYRM/MrRc9VmXueYSVdwlPC02c2GGKC99eyp4E1H1PFlI
	9awA==
X-Gm-Message-State: APjAAAVwRYfrH5+oIVlo07mBoXi2uollAwARzbiBukuMzfIgt61PplRy
	cIVqpvuWjFgf0Rl5q+TePoENxWKLv6b6+YzDtidFI8ubylW6Bgc5k9FN6lpmpFLICl6CEmQ9nTb
	+4Pm1inR3lEgBYErWoCMNcyPRmOK6dePgj6CvQg5RvA==
X-Received: by 2002:a37:5844:: with SMTP id m65mr11138657qkb.8.1567497150226; 
	Tue, 03 Sep 2019 00:52:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxPKf56D4zulPkjS1uniJi2ZthFcDbuCfyyWQiloLWW+r84IVWn8HgdNxVCd23C2u8N+9ZKag==
X-Received: by 2002:a37:5844:: with SMTP id m65mr11138647qkb.8.1567497150074; 
	Tue, 03 Sep 2019 00:52:30 -0700 (PDT)
Received: from redhat.com (bzq-79-180-62-110.red.bezeqint.net. [79.180.62.110])
	by smtp.gmail.com with ESMTPSA id
	d45sm5358006qtc.70.2019.09.03.00.52.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 00:52:29 -0700 (PDT)
Date: Tue, 3 Sep 2019 03:52:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v4 1/5] vsock/virtio: limit the memory used per-socket
Message-ID: <20190903034747-mutt-send-email-mst@kernel.org>
References: <20190730093539.dcksure3vrykir3g@steredhat>
	<20190730163807-mutt-send-email-mst@kernel.org>
	<20190801104754.lb3ju5xjfmnxioii@steredhat>
	<20190801091106-mutt-send-email-mst@kernel.org>
	<20190801133616.sik5drn6ecesukbb@steredhat>
	<20190901025815-mutt-send-email-mst@kernel.org>
	<20190901061707-mutt-send-email-mst@kernel.org>
	<20190902095723.6vuvp73fdunmiogo@steredhat>
	<20190903003823-mutt-send-email-mst@kernel.org>
	<20190903074554.mq6spyivftuodahy@steredhat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903074554.mq6spyivftuodahy@steredhat>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
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

On Tue, Sep 03, 2019 at 09:45:54AM +0200, Stefano Garzarella wrote:
> On Tue, Sep 03, 2019 at 12:39:19AM -0400, Michael S. Tsirkin wrote:
> > On Mon, Sep 02, 2019 at 11:57:23AM +0200, Stefano Garzarella wrote:
> > > > 
> > > > Assuming we miss nothing and buffers < 4K are broken,
> > > > I think we need to add this to the spec, possibly with
> > > > a feature bit to relax the requirement that all buffers
> > > > are at least 4k in size.
> > > > 
> > > 
> > > Okay, should I send a proposal to virtio-dev@lists.oasis-open.org?
> > 
> > How about we also fix the bug for now?
> 
> This series unintentionally fix the bug because we are introducing a way
> to split the packet depending on the buffer size ([PATCH 4/5] vhost/vsock:
> split packets to send using multiple buffers) and we removed the limit
> to 4K buffers ([PATCH 5/5] vsock/virtio: change the maximum packet size
> allowed).
> 
> I discovered that there was a bug while we discussed memory accounting.
> 
> Do you think it's enough while we introduce the feature bit in the spec?
> 
> Thanks,
> Stefano

Well locking is also broken (patch 3/5).  It seems that 3/5 and 4/5 work
by themselves, right?  So how about we ask Dave to send these to stable?
Also, how about 1/5? Also needed for stable?


-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
