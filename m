Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 19405D5668
	for <lists.virtualization@lfdr.de>; Sun, 13 Oct 2019 15:42:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8B14123A6;
	Sun, 13 Oct 2019 13:42:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 50C14239C
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 13:29:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mout.web.de (mout.web.de [212.227.15.3])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C3CB15D3
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 13:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1570973375;
	bh=Nr42B9aBot+89ngMAgddWyD408N4oSxV4VDb4qYDa/E=;
	h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
	b=I1aRlrCpg8KCPOyIEOQQM6kHtTvUesjrBkw0pvhZPC6BH8f6ZH5TKVQ2R4Iyw1Ngg
	t/TFhTSpuEpo7x9iT3Iif7l4pNqAQeLkOWtgLu3j/xKdoqZKDWe3axif41ok7EL2Ht
	y2k6DgoCaAAYwAlLInD+tl+8TJhSzaSUfp2gUmzI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb004
	[213.165.67.108]) with ESMTPSA (Nemesis) id 0LfEfA-1hiNEM3coS-00onRW;
	Sun, 13 Oct 2019 15:29:34 +0200
Subject: Re: [PATCH] tools/virtio: Fix build
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <4b686914-075b-a0a9-c97b-9def82ee0336@web.de>
	<20191013075107-mutt-send-email-mst@kernel.org>
	<08c1e081-765b-7c3a-ed31-2059dc521fd0@web.de>
	<20191013081541-mutt-send-email-mst@kernel.org>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <eacb6818-fe3e-f983-9946-e172f0077d4b@web.de>
Date: Sun, 13 Oct 2019 15:29:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191013081541-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Provags-ID: V03:K1:u38kb41fQZHanwjHDCiuNl8EpyKeLVtNVqpe6qF/BXbhMZpL64P
	SYcBUBPHZLcLYqPhV7OS3kXmXYDs4DNH3Zl6rG6aronuhRQTlND3bZN7iFJs9GGCdPrJ66b
	wt8xD2sMINgC6ziCE0exTDEm4A2LhGKLxmBtYbfRv9KefLyCHPHyYhYMNsOW/uNB+ZuvefW
	OF8bo8dFW03AAzliY/xeA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:T2cwXKca+Ss=:idTQ0bM/ueDQ27qTDnnmJe
	EbguWUybeeWnceajsFa8Uh75JDVmpN8lmPiHWgNosobbUoJFqpvAJm1y1vO83K4bonsJCS2uB
	329EXUFzCRSCBVeoqHNHDy5WQtoXybOYFYPOl7YhWiVVCjIdjAHjE9s5iqcWDIimh/te40Umq
	FRcdtGPXlNuqFUv8HUh0gGLdgaQ7outkZJyIjrK0wEdEwr4U3QlgVU1dbTu5sLEAxEZ8EUx5f
	EkQM8ZnXXkglwPA+96pMgUNbTELkVYks0NLf/k7s+5j0RDizPPKCNHtK4gWo6a7dvRP7ZHLKX
	IoBL/k9WQECVFgMoKNYIGJjuF7E5Sty6kvb/4xmjIZema7+vdfmmOOREK2r8AWTxwDwUMxU/A
	27l436kdA1gwTdzVoeIaY3lSmE3ddp7KbWG467FSMR+1NtSDZ2zKSKhPVxa1veL/1MrIssh0+
	QoUe1+pNqcymf7k7M0rYCf/QY+sPqBVzYGH/xT0J41wh9GQLVmL8chHkiGyla34B4SOLz0Y5w
	/JQRLAGUwRMEleobwmyqOhLF+zMtwMvfVt94Uc2aXnpzljDlqxe6h0nILVE4EfSF9377WTLRg
	JhYu6Ektdo794JAv1EkjbPTUOsAiNq/htxI7H+hPLV18Y9xRxVl7ABPME4/wnHivgTroJ/ZQm
	2+OHDUfIwmidHzO59VAEqvgx8hcxtcHzvbNdGpfCyefZ7oXGnf4+FAWBVUsSKToZH8xPqTneg
	guQX9WQMNLlPo62agC+3zUW/CsM3J/JGWDB7WFhL4WvlSJh33eiJgDREYooLKwjdKLBhzufRR
	kvFA3DXbnJ0YiGx5Q+p/z5CqQme3WWHlBt4A6T37fZUPrLnWZDrRJqxPFzphXaS8+7LN3Uoni
	MQgRwT03ibRRZiNpKZ3ysdD2mA8H8/rax0vFKTiDdjElyrPg/osKIZ/6Au2Q25oR3eytlpmkJ
	2JkDsSKeb9apCmkmTj5wrCAgD+mWZudTs48AAzTY3/fonpV27KaotYrZsT8JCZpKMPBlR70CP
	YSyF3mWs7PiNJvDtYVH1GoZHcxKGJbScfog69tVahLQmcKcd+xopVjyK8h1Pl86UYch2+9XQM
	VoX0aCieIF99GTlmheDrr+kEXy2CKnXmgR8uQEB+zySDLziFIzG3hf00TPO0IrUqv8t56W6Rl
	rMUM5l6gXitNThNbqigYVyl8+iRuytowD3u5dMBwTsly7B+bxOC2fFZe7Z0O6f3F0BW2vNUYo
	Di8acTbgFsYgIvyd1ocV9hUeouvUBk9HK5t1eKp9llaM0T/XkwNMsHNf/tn9AVh65uTlC01DZ
	XQ2KjS6l0Yt0Kh4eQhclCtw7414W6MfY+J/s0KoMyfidbeREHqR+l0xexntP0ctFzkA/jFSQp
	g/veluVA/YQDb5564WxoSUHXQ01Iji68jsh9KNmrhc=
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>
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

On 13.10.19 14:20, Michael S. Tsirkin wrote:
> On Sun, Oct 13, 2019 at 02:01:03PM +0200, Jan Kiszka wrote:
>> On 13.10.19 13:52, Michael S. Tsirkin wrote:
>>> On Sun, Oct 13, 2019 at 11:03:30AM +0200, Jan Kiszka wrote:
>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>>
>>>> Various changes in the recent kernel versions broke the build due to
>>>> missing function and header stubs.
>>>>
>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>
>>> Thanks!
>>> I think it's already fixes in the vhost tree.
>>> That tree also includes a bugfix for the test.
>>> Can you pls give it a spin and report?
>>
>> Mostly fixed: the xen_domain stup is missing.
>>
>> Jan
>
> That's in xen/xen.h. Do you still see any build errors?

ca16cf7b30ca79eeca4d612af121e664ee7d8737 lacks this - forgot to add to
some commit?

Jan
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
