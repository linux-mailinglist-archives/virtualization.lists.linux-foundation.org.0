Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1CC7DF81
	for <lists.virtualization@lfdr.de>; Thu,  1 Aug 2019 17:54:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 914AA896C;
	Thu,  1 Aug 2019 15:54:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1B6CC895D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 15:53:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 599B35F4
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 15:53:36 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id h28so50591949lfj.5
	for <virtualization@lists.linux-foundation.org>;
	Thu, 01 Aug 2019 08:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jOies/q8GNu6zMRJDNga96FSVWyO2X9XensDmj1AZZY=;
	b=JCfUKgCbIl3b8Om0ozKmxK3ZkAX7v5HdGpeskesaFuP4NVGJl/awlJnYAPCtEVSloc
	lzcOj6CeND6AuD80dr4q1nJBDmRFU2KqlXk9+ptF9UyEfTbMir9PajC+w3TevrMU1QoH
	5DhGRwdIMNBej8DEM2/cRH4RJvSjQ8ijfcZ6NPBCDsO/9awA61b+xRtL/izy/7RChYgz
	xTwQzNHzisQ2LYNZskcc+ZWMrodoblpe5iCPH3IT6NXa5X/R9AccGBJEJPnLdMVO54Am
	kK8utE4/RrvLlDgPlD3Taj9+1QnLV4AmRZXmPVkCyhvXdMHhxVJppbxOVcR7A9M2e9A2
	zOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=jOies/q8GNu6zMRJDNga96FSVWyO2X9XensDmj1AZZY=;
	b=DvnE23GocifdE7er+dR30E+KldWemI8dTZpB4JiBXZtq0HmO2a77Z96m9goIH99NSb
	XHLFQtDH7EOehjgFbJKrMp47OKrZvPARBfyBg3fo8DQirFjZRF0G2KcWrOr+wcVzmqkU
	73C0yQODhDNcNyrZv1wuCKrySdYBJR76KR+9jmvv0Mwy/2x+WlxqU3ahzqmxw4IzbUMk
	ELMci9Al+uIkheQhH5XbXOoy8HOT3HxbboKWYzn7l19kz0NVcj3aSj+6V8FrCGOnv23V
	A9aj6v1i69u23MIgbxOUrXLpui6ki43CSAZE08tJ0ql6jgwOKcrfcVQCjtmewQGSp18Z
	bmdQ==
X-Gm-Message-State: APjAAAXksf0iNy65V0LD6QqJvPJsFvuC7i3tRCxaaj0HlBQAw+LHuj/K
	SLVGAP2QqVdDMQrR9Q9MwbN8Gw==
X-Google-Smtp-Source: APXvYqzp9NIlaxkTBvMmj+xKyDzpb+n9dCj96Ve4HvOBx6VdwDWSrusU3JCFMHB8k+qhxDs91gSPrA==
X-Received: by 2002:a19:5f46:: with SMTP id a6mr63906353lfj.142.1564674814647; 
	Thu, 01 Aug 2019 08:53:34 -0700 (PDT)
Received: from wasted.cogentembedded.com
	([2a00:1fa0:6ee:d28:6484:8b6b:cce6:b9f0])
	by smtp.gmail.com with ESMTPSA id
	q4sm16666213lje.99.2019.08.01.08.53.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Aug 2019 08:53:34 -0700 (PDT)
Subject: Re: [PATCH v2 10/11] vsock_test: skip read() in test_stream*close
	tests on a VMCI host
To: Stefano Garzarella <sgarzare@redhat.com>, netdev@vger.kernel.org
References: <20190801152541.245833-1-sgarzare@redhat.com>
	<20190801152541.245833-11-sgarzare@redhat.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <79ffb2a6-8ed2-cce2-7704-ed872446c0fe@cogentembedded.com>
Date: Thu, 1 Aug 2019 18:53:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190801152541.245833-11-sgarzare@redhat.com>
Content-Language: en-MW
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
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

Hello!

On 08/01/2019 06:25 PM, Stefano Garzarella wrote:

> When VMCI transport is used, if the guest closes a connection,
> all data is gone and EOF is returned, so we should skip the read
> of data written by the peer before closing the connection.
> 
> Reported-by: Jorgen Hansen <jhansen@vmware.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  tools/testing/vsock/vsock_test.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
> index cb606091489f..64adf45501ca 100644
> --- a/tools/testing/vsock/vsock_test.c
> +++ b/tools/testing/vsock/vsock_test.c
[...]
> @@ -79,16 +80,27 @@ static void test_stream_client_close_server(const struct test_opts *opts)
>  		exit(EXIT_FAILURE);
>  	}
>  
> +	local_cid = vsock_get_local_cid(fd);
> +
>  	control_expectln("CLOSED");
>  
>  	send_byte(fd, -EPIPE);
> -	recv_byte(fd, 1);
> +
> +	/* Skip the read of data wrote by the peer if we are on VMCI and

   s/wrote/written/?

> +	 * we are on the host side, because when the guest closes a
> +	 * connection, all data is gone and EOF is returned.
> +	 */
> +	if (!(opts->transport == TEST_TRANSPORT_VMCI &&
> +	    local_cid == VMADDR_CID_HOST))
> +		recv_byte(fd, 1);
> +
>  	recv_byte(fd, 0);
>  	close(fd);
>  }
[...]

MBR, Sergei
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
