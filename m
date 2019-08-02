Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8307EE19
	for <lists.virtualization@lfdr.de>; Fri,  2 Aug 2019 09:55:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5F284E43;
	Fri,  2 Aug 2019 07:55:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 52F9DE3C
	for <virtualization@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 07:55:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 97515712
	for <virtualization@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 07:55:12 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r1so76124937wrl.7
	for <virtualization@lists.linux-foundation.org>;
	Fri, 02 Aug 2019 00:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=iQeecZfwLuP7CODOolIpmoLPGZENj4z5U1obZlPPBsE=;
	b=kJ5WZYj7+c7ymAw9tzR6zj0XlTKz38f1sZOGTixkTuvPZ3on0rthVsAXnMD03A8Pvy
	XpcmtfQy5LbW7kFgVbqE2W8fwjxlWd42JTRvifny3kMhYpWiDijqNyHKWadnLbb3D1t2
	kdjR33VVcKEIAiYrfhcqbsRCLZfXbCi/5U2pgsYm+rwxZrLGIDCanNqx5nQUA+DxDuOo
	jtAg0G6YVWJidTF4eE9h0okHKhF05XgmBYL2vT33i+gP281ChGVXZVVSVOzsNKDXiwqU
	A/0ptNJqvF4wXPWvBHY/du0JAS6QrMleINyD5278KoIiwou0eGnQZBukKEYYkF0LF/wl
	Xp3Q==
X-Gm-Message-State: APjAAAWT0F7lp9Wr4UM+fFBDIqmT7AG6Xqw9jAUsekoL9UrLTk9urA0U
	OawDaQNC0Y73XqHGhNJ1GCw4Yw==
X-Google-Smtp-Source: APXvYqxJYMba81q1+ZjYpm8CUmRIMpGHEf3SB8tgLMove58CtJewiAKhbgEp6Gf/LDnWAQBR7N5n+w==
X-Received: by 2002:a05:6000:42:: with SMTP id
	k2mr23783548wrx.80.1564732511147; 
	Fri, 02 Aug 2019 00:55:11 -0700 (PDT)
Received: from steredhat (host122-201-dynamic.13-79-r.retail.telecomitalia.it.
	[79.13.201.122]) by smtp.gmail.com with ESMTPSA id
	j9sm83739926wrn.81.2019.08.02.00.55.09
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 00:55:10 -0700 (PDT)
Date: Fri, 2 Aug 2019 09:55:08 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Dexuan Cui <decui@microsoft.com>
Subject: Re: [PATCH v2 00/11] VSOCK: add vsock_test test suite
Message-ID: <20190802075508.tumpam2vfmynuhd5@steredhat>
References: <20190801152541.245833-1-sgarzare@redhat.com>
	<PU1P153MB0169B265ECA51CB0AE1212DEBFDE0@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PU1P153MB0169B265ECA51CB0AE1212DEBFDE0@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
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

On Thu, Aug 01, 2019 at 04:16:37PM +0000, Dexuan Cui wrote:
> > From: Stefano Garzarella <sgarzare@redhat.com>
> > Sent: Thursday, August 1, 2019 8:26 AM
> > 
> > The vsock_diag.ko module already has a test suite but the core AF_VSOCK
> > functionality has no tests.  This patch series adds several test cases that
> > exercise AF_VSOCK SOCK_STREAM socket semantics (send/recv,
> > connect/accept,
> > half-closed connections, simultaneous connections).
> > 
> > Dexuan: Do you think can be useful to test HyperV?
> 
> Hi Stefano,
> Thanks! This should be useful, though I have to write the Windows host side
> code to use the test program(s). :-)
> 

Oh, yeah, I thought so :-)

Let me know when you'll try to find out if there's a problem.

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
