Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4F7AA349
	for <lists.virtualization@lfdr.de>; Thu,  5 Sep 2019 14:34:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 509BA1825;
	Thu,  5 Sep 2019 12:34:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CF4911739
	for <virtualization@lists.linux-foundation.org>;
	Thu,  5 Sep 2019 12:34:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.heh.ee (heh.ee [213.35.143.160])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1558B756
	for <virtualization@lists.linux-foundation.org>;
	Thu,  5 Sep 2019 12:34:08 +0000 (UTC)
Received: from [0.0.0.0] (unknown [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.heh.ee (Postfix) with ESMTPSA id 05B9C16BF1F;
	Thu,  5 Sep 2019 15:34:06 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ristioja.ee; s=mail;
	t=1567686846; bh=LFJJB8HaRCeJflug32dzVDXPw+towLk1sQP9ogor7+A=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=CZYFfli/f+r3GSXDHeu3Xk/mw2JOlWDFAjueuJ5OXXzuOkPEPJjx9D1A+z4lMpy8D
	J/U25+xiF3ZhAWaiX3eM96x67vZyCbKsePG8cD3KV73LpOd9u0J+JVrcu5CJHELu+N
	mJZOXBW9G41Y1oS9e/R96a4REJ3a/4zI+PLlQa6E=
Subject: Re: Xorg indefinitely hangs in kernelspace
To: Gerd Hoffmann <kraxel@redhat.com>
References: <92785039-0941-4626-610b-f4e3d9613069@ristioja.ee>
	<20190905071407.47iywqcqomizs3yr@sirius.home.kraxel.org>
From: Jaak Ristioja <jaak@ristioja.ee>
Openpgp: preference=signencrypt
Autocrypt: addr=jaak@ristioja.ee; prefer-encrypt=mutual; keydata=
	mDMEWyjlXBYJKwYBBAHaRw8BAQdABEPNmQfWmwZZXSl5vKnpI1UVtS4l2N9kv7KqyFYtfLe0
	IEphYWsgUmlzdGlvamEgPGphYWtAcmlzdGlvamEuZWU+iJYEExYIAD4WIQTjaPCMFhRItZ2p
	iV/uxscoTrbt3AUCWyjlXAIbIwUJA8OZNAULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRDu
	xscoTrbt3OYPAP9l6ZjLh4qK2r/H1b+7a7qZIAjwf0o4AX6qvtX1WERxywEAhhtOHg+G8idL
	FR08XPW7nlobl2qEHMnqBTqteSsz1gG4OARbKOVcEgorBgEEAZdVAQUBAQdAU6y3a2gcxTI+
	bZgPkJjPXxr0tvuLpCqkIb/envF5ajADAQgHiH4EGBYIACYWIQTjaPCMFhRItZ2piV/uxsco
	Trbt3AUCWyjlXAIbDAUJA8OZNAAKCRDuxscoTrbt3OG5AP0cd6gLbKVSBvSEgRNQ+BNk/1a5
	lSQtocXAcwUx0X9h0gEAqIZ9u7pCWBlRTL+rij97VWWkB/jb1deZ2gExNhd6RAU=
Message-ID: <e4b7d889-15f3-0c90-3b9f-d395344499c0@ristioja.ee>
Date: Thu, 5 Sep 2019 15:34:12 +0300
User-Agent: undefined
MIME-Version: 1.0
In-Reply-To: <20190905071407.47iywqcqomizs3yr@sirius.home.kraxel.org>
Content-Language: en-US
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
	Daniel Vetter <daniel@ffwll.ch>, spice-devel@lists.freedesktop.org,
	Dave Airlie <airlied@redhat.com>
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

On 05.09.19 10:14, Gerd Hoffmann wrote:
> On Tue, Aug 06, 2019 at 09:00:10PM +0300, Jaak Ristioja wrote:
>> Hello!
>>
>> I'm writing to report a crash in the QXL / DRM code in the Linux kernel.
>> I originally filed the issue on LaunchPad and more details can be found
>> there, although I doubt whether these details are useful.
> 
> Any change with kernel 5.3-rc7 ?

Didn't try. Did you change something? I could try, but I've done so
before and every time this bug manifests itself with MAJOR.MINOR-rc# I
get asked to try version MAJOR.(MINOR+1)-rc# so I guess I could as well
give up?

Alright, I'll install 5.3-rc7, but once more it might take some time for
this bug to expose itself.

One thing to note though, is that this occurred much more often with
older kernels (or older versions of the Kubuntu desktop/Firefox in my
VM), sometimes even several times in an hour of use.


Best regards,
J
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
