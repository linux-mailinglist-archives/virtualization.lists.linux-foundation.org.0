Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 053422B040F
	for <lists.virtualization@lfdr.de>; Thu, 12 Nov 2020 12:41:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A1B412E1AA;
	Thu, 12 Nov 2020 11:40:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JuzR3HrTRcmb; Thu, 12 Nov 2020 11:40:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 076B62E193;
	Thu, 12 Nov 2020 11:40:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D02C1C1AD8;
	Thu, 12 Nov 2020 11:40:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4910C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 11:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C0BEF86A86
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 11:40:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sXMKMQw+FPJX
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 11:40:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E47B484AF9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 11:40:56 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d12so5611319wrr.13
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 03:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hiH9YFvFj7u18VTdjYlvXbTm7Y6vPC/QKgUkjRYPlj0=;
 b=G3iMxfPdcSlq2kqWuNRyA9VaTuD6kH1gafYeQTw0/GJmXm8nu84CdTkmgl+t+wc3r5
 Y94u72Lu4HTssWwQaKnT4PeHhaqIYZd6M7NGNGIcRhtirha3BVAw72dMUXPamn8zgP+N
 lK6H1l6W0CdQBcxBobq9M1tB9Ds3P85FcNyrYybJqJxy5cy4PZd/42FrTFRFr26/aAA8
 rAbWOAPdrk3IHvuvHxsvd3KxHYXbpwdcDIniGACLpY2hF+SKY2oH+alvlBwfNjaPuomu
 3ZxDQo9Q9TK+GLus5qpsK9JB3jsGtQWiH3UV9bkTlxIEtDDv1vJ8HHiVTmA08ZY871sc
 Js0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hiH9YFvFj7u18VTdjYlvXbTm7Y6vPC/QKgUkjRYPlj0=;
 b=LRcFf/WHkqixT6xV5Cm8iT0ypNli/DyV9UQ2pYloJt7+GlEkon1meefMd/c4W7H0fg
 ZA1jJZtzeTNX/EKAcAPR1p5KNs7SufeaMGCj7RLCskkPAi/Cltgk/K6OIgbLnDDx98ni
 cF8OAfKnPaVqQtyIvGpjDYdgPJ2M5A6Q5rleDnulVRVDsdaDgovi2ai/DZC4BF6OLzs/
 WL5+TlZN86RMq4E4QjMICG/JW6Dm6H6YQhNbPXle1eUWRJyg9mTshKK6Gsn5DTiCUfGU
 27iBtv+WoCpTtVbUMflCVgnK7z572O9IHyUHiSP9z8Gm+H2kI24WvLdrvf4PAPfX4SV+
 BbiQ==
X-Gm-Message-State: AOAM5339LSZiR8cboKEOXoqiESn5sgR2CRrH3+/1kfvbDohY17kmXgUB
 dcWKB5NjR++S3R496ADdFV2yiw==
X-Google-Smtp-Source: ABdhPJyYnJvDHJTFtxxktHznzaXTPpIA0hl6/kGsg1GUlsBx6odch4HOXNEy7ilq+yAmu9wUWTR5lg==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr33909986wrs.377.1605181255351; 
 Thu, 12 Nov 2020 03:40:55 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:6971:b700:3764:fa96?
 ([2a01:e34:ed2f:f020:6971:b700:3764:fa96])
 by smtp.googlemail.com with ESMTPSA id z3sm5815106wrw.87.2020.11.12.03.40.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 03:40:54 -0800 (PST)
Subject: Re: [PATCH v2 05/17] clocksource/hyperv: use MSR-based access if
 running as root
To: Wei Liu <wei.liu@kernel.org>
References: <20201105165814.29233-1-wei.liu@kernel.org>
 <20201105165814.29233-6-wei.liu@kernel.org>
 <3527e98a-faab-2360-f521-aa04bbe92edf@linaro.org>
 <20201112112437.lt3g5bhpjym3evu5@liuwe-devbox-debian-v2>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <2c5101fb-f3de-7b0c-ee76-e5a0e6b32098@linaro.org>
Date: Thu, 12 Nov 2020 12:40:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201112112437.lt3g5bhpjym3evu5@liuwe-devbox-debian-v2>
Content-Language: en-US
Cc: Linux on Hyper-V List <linux-hyperv@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Michael Kelley <mikelley@microsoft.com>,
 Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 virtualization@lists.linux-foundation.org,
 Vineeth Pillai <viremana@linux.microsoft.com>,
 Thomas Gleixner <tglx@linutronix.de>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gMTIvMTEvMjAyMCAxMjoyNCwgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIE5vdiAxMiwgMjAy
MCBhdCAxMDo1NjoxN0FNICswMTAwLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPj4gT24gMDUvMTEv
MjAyMCAxNzo1OCwgV2VpIExpdSB3cm90ZToKPj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdl
aS5saXVAa2VybmVsLm9yZz4KCkFja2VkLWJ5OiBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVsLmxlemNh
bm9AbGluYXJvLm9yZz4KCj4+PiAtLS0KPj4KPj4gSSB3b3VsZCBsaWtlIHRvIGFwcGx5IHRoaXMg
cGF0Y2ggYnV0IHRoZSBjaGFuZ2Vsb2cgaXMgdG9vIHNob3J0IChvbmUgbGluZSkuCj4+Cj4+IFBs
ZWFzZSBhZGQgYSBzbWFsbCBwYXJhZ3JhcGggKG5vIG5lZWQgdG8gcmVzZW5kIGp1c3QgYW5zd2Vy
IGhlcmUsIEkgd2lsbAo+PiBhbWVuZCB0aGUgbG9nIG15c2VsZi4KPiAKPiBQbGVhc2UgZG9uJ3Qg
YXBwbHkgdGhpcyB0byB5b3VyIHRyZWUuIEl0IGlzIGRlcGVuZGVudCBvbiBhIHByZXZpb3VzCj4g
cGF0Y2guIEkgZXhwZWN0IHRoaXMgc2VyaWVzIHRvIGdvIHRocm91Z2ggdGhlIGh5cGVydiB0cmVl
Lgo+IAo+IEkgd2lsbCBhZGQgaW4gdGhpcyBzbWFsbCBwYXJhZ3JhcGggaW4gYSBsYXRlciB2ZXJz
aW9uOgo+IAo+ICAgICBXaGVuIExpbnV4IHJ1bnMgYXMgdGhlIHJvb3QgcGFydGl0aW9uLCB0aGUg
c2V0dXAgcmVxdWlyZWQgZm9yIFRTQyBwYWdlCj4gICAgIGlzIGRpZmZlcmVudC4gTHVja2lseSBM
aW51eCBhbHNvIGhhcyBhY2Nlc3MgdG8gdGhlIE1TUiBiYXNlZAo+ICAgICBjbG9ja3NvdXJjZS4g
V2UgY2FuIGp1c3QgZGlzYWJsZSB0aGUgVFNDIHBhZ2UgY2xvY2tzb3VyY2UgaWYgTGludXggaXMK
PiAgICAgdGhlIHJvb3QgcGFydGl0aW9uLgo+IAo+IElmIHlvdSdyZSBoYXBweSB3aXRoIHRoZSBk
ZXNjcmlwdGlvbiwgSSB3b3VsZCBsb3ZlIHRvIGhhdmUgYW4gYWNrIGZyb20KPiB5b3UuIEkgd2ls
bCBmdW5uZWwgdGhlIHBhdGNoIHZpYSB0aGUgaHlwZXJ2IHRyZWUuCj4gCj4gV2VpLgo+IAoKCi0t
IAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29m
dHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2su
Y29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFy
b29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9n
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxp
emF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92
aXJ0dWFsaXphdGlvbg==
