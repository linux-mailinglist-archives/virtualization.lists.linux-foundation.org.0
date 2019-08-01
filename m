Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3597DF96
	for <lists.virtualization@lfdr.de>; Thu,  1 Aug 2019 17:59:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 674D28998;
	Thu,  1 Aug 2019 15:59:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D809F6C97
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 15:58:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 41B8F8B4
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 15:58:41 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id u25so53324897wmc.4
	for <virtualization@lists.linux-foundation.org>;
	Thu, 01 Aug 2019 08:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=a0EUgeGqQ7K8JBk8474/F7Qfdf6czPogTZsCAuEQGPE=;
	b=aaOkdqV9KNQmweO8y7Wb5kJLy617zvrqraqKExSu4tG4DvE+RWQ4S3G5kpWkkv7tvP
	bMI51D5goPCjJX4g72xEfoktG7itNURx1ClYLC7A9NotMouXQtkm/X3ag1TdqNnb0QLw
	4RGKseM8VfGbhZ4n4OVWKGjk9lyV4WbbuC3VHUwmU+fI+Y7XL1BFy0KiMLh0YtMiVTh7
	gFgTCTPgknFnrv+hj+PAB++RkwHpvQ6Gkz0pka8misPVHFrOQx8jufZ5qff1F5Jnndsg
	fcn/fJaK1Tiy3WHqx23QeTV6r+h4b08Xyu3WmsUhQUE1I2UvEB4oCCCzMaY7JloEC9+J
	Vu6w==
X-Gm-Message-State: APjAAAX+IcxJX/jmMGrc+1LI/e1vQk+LjQDgJhY2Y4os3tIVImvRHwcC
	Ns2aZb7EZS19oy0Zkb3443MWlA==
X-Google-Smtp-Source: APXvYqzzbNpTopM4KULhskQlC6/TwvH5ODVZW62e6oBlm1yrl91OGvxzGfqciA+7f4tgcVTJRlc2uQ==
X-Received: by 2002:a05:600c:2388:: with SMTP id
	m8mr15142423wma.23.1564675119726; 
	Thu, 01 Aug 2019 08:58:39 -0700 (PDT)
Received: from steredhat (host122-201-dynamic.13-79-r.retail.telecomitalia.it.
	[79.13.201.122]) by smtp.gmail.com with ESMTPSA id
	r4sm44542036wrq.82.2019.08.01.08.58.38
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 01 Aug 2019 08:58:39 -0700 (PDT)
Date: Thu, 1 Aug 2019 17:58:36 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 10/11] vsock_test: skip read() in test_stream*close
	tests on a VMCI host
Message-ID: <20190801155836.ssounrtdtm5m6q6u@steredhat>
References: <20190801152541.245833-1-sgarzare@redhat.com>
	<20190801152541.245833-11-sgarzare@redhat.com>
	<79ffb2a6-8ed2-cce2-7704-ed872446c0fe@cogentembedded.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <79ffb2a6-8ed2-cce2-7704-ed872446c0fe@cogentembedded.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
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

On Thu, Aug 01, 2019 at 06:53:32PM +0300, Sergei Shtylyov wrote:
> Hello!
> 

Hi :)

> On 08/01/2019 06:25 PM, Stefano Garzarella wrote:
> 
> > When VMCI transport is used, if the guest closes a connection,
> > all data is gone and EOF is returned, so we should skip the read
> > of data written by the peer before closing the connection.
> > 
> > Reported-by: Jorgen Hansen <jhansen@vmware.com>
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> >  tools/testing/vsock/vsock_test.c | 26 ++++++++++++++++++++++++--
> >  1 file changed, 24 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
> > index cb606091489f..64adf45501ca 100644
> > --- a/tools/testing/vsock/vsock_test.c
> > +++ b/tools/testing/vsock/vsock_test.c
> [...]
> > @@ -79,16 +80,27 @@ static void test_stream_client_close_server(const struct test_opts *opts)
> >  		exit(EXIT_FAILURE);
> >  	}
> >  
> > +	local_cid = vsock_get_local_cid(fd);
> > +
> >  	control_expectln("CLOSED");
> >  
> >  	send_byte(fd, -EPIPE);
> > -	recv_byte(fd, 1);
> > +
> > +	/* Skip the read of data wrote by the peer if we are on VMCI and
> 
>    s/wrote/written/?
> 

Thanks, I'll fix it!
Stefano

> > +	 * we are on the host side, because when the guest closes a
> > +	 * connection, all data is gone and EOF is returned.
> > +	 */
> > +	if (!(opts->transport == TEST_TRANSPORT_VMCI &&
> > +	    local_cid == VMADDR_CID_HOST))
> > +		recv_byte(fd, 1);
> > +
> >  	recv_byte(fd, 0);
> >  	close(fd);
> >  }
> [...]
> 
> MBR, Sergei

-- 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
