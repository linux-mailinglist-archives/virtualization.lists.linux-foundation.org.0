Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EE73C98F3B
	for <lists.virtualization@lfdr.de>; Thu, 22 Aug 2019 11:24:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 437CA104C;
	Thu, 22 Aug 2019 09:15:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 093BC103B
	for <virtualization@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 09:15:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 96573735
	for <virtualization@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 09:15:52 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD3A385545
	for <virtualization@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 09:15:51 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id q9so2898664wrc.12
	for <virtualization@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 02:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=20y8QC7R6t0IGb5Wrdbux5c0c2oCVqxmDr+q12FCKEs=;
	b=f5pztwhX1o4w7dJTEJtqxUf14mnae/ztGYTLK9O8LCs/NclT7g6F2tV+LZsWTNWxwD
	y4EuVqaLKbQHkom2i0egdT9fQwihwM7GnXVeGihApRQprmyMPJfcqNT70MfqU+WcnxWU
	3DhkDs4p2yDWIxuA7L5Fxix4FuDWInn8WboKGYfHRaRD6/wbJooujYDOOdxof3MUKZpR
	CmArOFnBcWAKTR/EKQ5OEFUviPf21ZPH8RaJUvMpww58ItmdLY32z0XFbIBjSh2vX73X
	qUi2PlYHGz+CZiFUGyDEwn+l0pnE5l6Gffmc8899bp+c8l51jbH8cxlJ3E3Wm7isshTs
	CRkQ==
X-Gm-Message-State: APjAAAXeEC5Ky9Ntj6hdztaTY9nCv+XsnhmfTOxqZcXHQiIsx6ns7O36
	eQ0XvMPHYX+sWBGLj4Mwh7GdbN3IzMEjpJxPo1KS4E9mue410wibKbT5YxKLgcGdkcoXWfUzHNq
	f3FIvYjplWtnpQBpJThGuErwoI5w83cH8Ui4dOVUCLA==
X-Received: by 2002:adf:e710:: with SMTP id c16mr2290124wrm.292.1566465350612; 
	Thu, 22 Aug 2019 02:15:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwumlNcw/ZaeykOzM5ZvW/kCRWj/R7ioHse/WHT5NLNMpD8iDBx8WLTrtd1YQliRUUYxN5lNw==
X-Received: by 2002:adf:e710:: with SMTP id c16mr2290089wrm.292.1566465350391; 
	Thu, 22 Aug 2019 02:15:50 -0700 (PDT)
Received: from steredhat (host80-221-dynamic.18-79-r.retail.telecomitalia.it.
	[79.18.221.80])
	by smtp.gmail.com with ESMTPSA id l9sm2678299wmi.29.2019.08.22.02.15.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 22 Aug 2019 02:15:49 -0700 (PDT)
Date: Thu, 22 Aug 2019 11:15:46 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 11/11] vsock_test: wait for the remote to close the
	connection
Message-ID: <20190822091546.qcns2kot6tzju7yv@steredhat>
References: <20190801152541.245833-1-sgarzare@redhat.com>
	<20190801152541.245833-12-sgarzare@redhat.com>
	<20190820082828.GA9855@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820082828.GA9855@stefanha-x1.localdomain>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
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

On Tue, Aug 20, 2019 at 09:28:28AM +0100, Stefan Hajnoczi wrote:
> On Thu, Aug 01, 2019 at 05:25:41PM +0200, Stefano Garzarella wrote:
> > +/* Wait for the remote to close the connection */
> > +void vsock_wait_remote_close(int fd)
> > +{
> > +	struct epoll_event ev;
> > +	int epollfd, nfds;
> > +
> > +	epollfd = epoll_create1(0);
> > +	if (epollfd == -1) {
> > +		perror("epoll_create1");
> > +		exit(EXIT_FAILURE);
> > +	}
> > +
> > +	ev.events = EPOLLRDHUP | EPOLLHUP;
> > +	ev.data.fd = fd;
> > +	if (epoll_ctl(epollfd, EPOLL_CTL_ADD, fd, &ev) == -1) {
> > +		perror("epoll_ctl");
> > +		exit(EXIT_FAILURE);
> > +	}
> > +
> > +	nfds = epoll_wait(epollfd, &ev, 1, TIMEOUT * 1000);
> > +	if (nfds == -1) {
> > +		perror("epoll_wait");
> > +		exit(EXIT_FAILURE);
> > +	}
> > +
> > +	if (nfds == 0) {
> > +		fprintf(stderr, "epoll_wait timed out\n");
> > +		exit(EXIT_FAILURE);
> > +	}
> > +
> > +	assert(nfds == 1);
> > +	assert(ev.events & (EPOLLRDHUP | EPOLLHUP));
> > +	assert(ev.data.fd == fd);
> > +
> > +	close(epollfd);
> > +}
> 
> Please use timeout_begin()/timeout_end() so that the test cannot hang.
> 

I used the TIMEOUT macro in the epoll_wait() to avoid the hang.
Do you think is better to use the timeout_begin()/timeout_end()?
In this case, should I remove the timeout in the epoll_wait()?

> > diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
> > index 64adf45501ca..a664675bec5a 100644
> > --- a/tools/testing/vsock/vsock_test.c
> > +++ b/tools/testing/vsock/vsock_test.c
> > @@ -84,6 +84,11 @@ static void test_stream_client_close_server(const struct test_opts *opts)
> >  
> >  	control_expectln("CLOSED");
> >  
> > +	/* Wait for the remote to close the connection, before check
> > +	 * -EPIPE error on send.
> > +	 */
> > +	vsock_wait_remote_close(fd);
> 
> Is control_expectln("CLOSED") still necessary now that we're waiting for
> the poll event?  The control message was an attempt to wait until the
> other side closed the socket.

Right, I'll remove it in the v3

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
