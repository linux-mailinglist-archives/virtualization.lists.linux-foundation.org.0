Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 175B4D5326
	for <lists.virtualization@lfdr.de>; Sun, 13 Oct 2019 00:47:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3BE0E212D;
	Sat, 12 Oct 2019 22:47:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7D612212C
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 22:38:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4FE81D0
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 22:38:55 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
	[209.85.160.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A434859FC
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 22:38:54 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id n59so13660666qtd.8
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 15:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=S0RIwai/cYE64lyIc+A9F/PqKRzGBKYVkHbCBiipZNM=;
	b=CjtGN/1T4aSXUMOjaEzYIRnqifrYDfchi20gFjmhMXkOSTezfnb3nM+17TVBSWNcYp
	Q+APFZ3zN66kKoQdRvhsE/iLzEDAl+nK6sW62AK5JUoVkNYCm0Fu0J/w+SPl9n+r3/o/
	9UHBx19apRDPl0L5RY0smgykpF/97cW5CzEWpRzXX7XQhQ9wR3REl+o+rIGbTtBCWTOg
	fwIogfBkUijcu/7i6LzNJBkr9cOU1oR435kIlZLsM6luqJFs4/eDwpuvrmwfBqspXDqt
	+yp+0QbH2Df9oW0CVW1waRvR+jyMPjovBWevIMHfyBNQUB1ZZw7+qvTSbD+mTRiqOMS3
	P/og==
X-Gm-Message-State: APjAAAXYBXiubXACzFhiY63o0lMa/qSTt+6fPmz/PK7CVCqwm5rwHy3R
	3fBR+DmnA6Y2ME5W5pYtmCpWoDKUhz6voaPwileiIhcnV66fEHkDztUZtpNg9Wg7HOkAMGjORI4
	u+gfZkrq5nkw66KX2Fcyt9vO2M9QqrdG7ImxQbCAgyw==
X-Received: by 2002:aed:25af:: with SMTP id x44mr24961934qtc.64.1570919933839; 
	Sat, 12 Oct 2019 15:38:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz0MjmCeNSh32vVCuUQMNhBZu1KOBCgrBIVtG1Hs9yeNlxecSX6iaR51H1qP+Z4lvase2/DGg==
X-Received: by 2002:aed:25af:: with SMTP id x44mr24961905qtc.64.1570919933558; 
	Sat, 12 Oct 2019 15:38:53 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	56sm11130495qty.15.2019.10.12.15.38.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Oct 2019 15:38:52 -0700 (PDT)
Date: Sat, 12 Oct 2019 18:38:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH net 0/2] vsock: don't allow half-closed socket in the
	host transports
Message-ID: <20191012183838-mutt-send-email-mst@kernel.org>
References: <20191011130758.22134-1-sgarzare@redhat.com>
	<20191011101408-mutt-send-email-mst@kernel.org>
	<20191011143457.4ujt3gg7oxco6gld@steredhat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011143457.4ujt3gg7oxco6gld@steredhat>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Adit Ranadive <aditr@vmware.com>, Stefan Hajnoczi <stefanha@redhat.com>,
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

On Fri, Oct 11, 2019 at 04:34:57PM +0200, Stefano Garzarella wrote:
> On Fri, Oct 11, 2019 at 10:19:13AM -0400, Michael S. Tsirkin wrote:
> > On Fri, Oct 11, 2019 at 03:07:56PM +0200, Stefano Garzarella wrote:
> > > We are implementing a test suite for the VSOCK sockets and we discovered
> > > that vmci_transport never allowed half-closed socket on the host side.
> > > 
> > > As Jorgen explained [1] this is due to the implementation of VMCI.
> > > 
> > > Since we want to have the same behaviour across all transports, this
> > > series adds a section in the "Implementation notes" to exaplain this
> > > behaviour, and changes the vhost_transport to behave the same way.
> > > 
> > > [1] https://patchwork.ozlabs.org/cover/847998/#1831400
> > 
> > Half closed sockets are very useful, and lots of
> > applications use tricks to swap a vsock for a tcp socket,
> > which might as a result break.
> 
> Got it!
> 
> > 
> > If VMCI really cares it can implement an ioctl to
> > allow applications to detect that half closed sockets aren't supported.
> > 
> > It does not look like VMCI wants to bother (users do not read
> > kernel implementation notes) so it does not really care.
> > So why do we want to cripple other transports intentionally?
> 
> The main reason is that we are developing the test suite and we noticed
> the miss match. Since we want to make sure that applications behave in
> the same way on different transports, we thought we would solve it that
> way.
> 
> But what you are saying (also in the reply of the patches) is actually
> quite right. Not being publicized, applications do not expect this behavior,
> so please discard this series.
> 
> My problem during the tests, was trying to figure out if half-closed
> sockets were supported or not, so as you say adding an IOCTL or maybe
> better a getsockopt() could solve the problem.
> 
> What do you think?
> 
> Thanks,
> Stefano

Sure, why not.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
