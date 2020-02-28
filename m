Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1091735FB
	for <lists.virtualization@lfdr.de>; Fri, 28 Feb 2020 12:21:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 246C786D62;
	Fri, 28 Feb 2020 11:21:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rQ-DZT6dSPiG; Fri, 28 Feb 2020 11:21:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C597686D59;
	Fri, 28 Feb 2020 11:21:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A16B5C0177;
	Fri, 28 Feb 2020 11:21:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8A37C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 11:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B1D9D86D59
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 11:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IamT4D-RFX72
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 11:21:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 155AB86D55
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 11:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582888902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OmP9QnBCw2YJQJIPW/QHveI7lGzTStctEOZNIPuqkxA=;
 b=OkzOGw5G6WFd+PSeQkrTQxdJgAAV8XtGOFqka2wbFJEiLalFajrLceh7mztHW1zFd8RQ3G
 bLi5Gxfc0/8cAaLlco38pIoFUW7mNTBz5z0cDKtUMdcA68BskvamQ5hTrsbsUWSYYI4mV5
 Dw0U63qcocIABHbvw8GbByhT21dSXIY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-SbdkB5sgPEGFh3K5QWpFMw-1; Fri, 28 Feb 2020 06:21:40 -0500
X-MC-Unique: SbdkB5sgPEGFh3K5QWpFMw-1
Received: by mail-wr1-f71.google.com with SMTP id u18so1192302wrn.11
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 03:21:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OmP9QnBCw2YJQJIPW/QHveI7lGzTStctEOZNIPuqkxA=;
 b=qUL+nrJ3RJuV21bjESUEUT1Mfr78Ld2pdVmgjmE3wVXKayPkMDK4LUxdobBKw0RdY6
 WgtTYFfvzkAD4JV3CqlaeNaNF2nelFgVCfTBnDtOW302TnDvoy99jhMCzFdrdGbWdLs3
 MxuF73w2l1dwOXnvFvHmHtWGPcp8lMrYVzeFYonkbe1BqWX5bIw81iJhoKFBJpCo8Bic
 EyGcKvTroQztWuqMUuHysHlfgwsWtgLWGzPUYegbwBJ0sNT3ND+R/X8Q4+B6k+L8omWo
 dZl3aalXxAJvkWBJ8kbfQjuxAsl5i1b72UkGK6lt5GBmpQ7gI3ReMLp4u3eiwS20ygzg
 cTuw==
X-Gm-Message-State: APjAAAW/PNONTxJSCBKdq1ScchrIFeyt0YgYoVO2PG7sSQEB/DNsBPtn
 YtWumGTjNEFul0ynNH1tn6OVudYGh5t+dRi7OufEVFlO0JSOxyraljAGqJ07jkjox+xkmIG4GzP
 AGgyEy4YFCne2Mh4jktWDkDSseJaWEZlW7wghwceZDA==
X-Received: by 2002:adf:f84d:: with SMTP id d13mr4552705wrq.92.1582888899685; 
 Fri, 28 Feb 2020 03:21:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqwu+eedluZq+tfSsf4HCoSRE+8TOQr8FvdgA3fees6Gr2KY5+Lp2eWu0FRBg+JBelZ7ch+k9Q==
X-Received: by 2002:adf:f84d:: with SMTP id d13mr4552677wrq.92.1582888899401; 
 Fri, 28 Feb 2020 03:21:39 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:d0d9:ea10:9775:f33f?
 ([2001:b07:6468:f312:d0d9:ea10:9775:f33f])
 by smtp.gmail.com with ESMTPSA id 18sm1802186wmf.1.2020.02.28.03.21.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2020 03:21:38 -0800 (PST)
Subject: Re: [virtio-dev] VIRTIO adoption in other hypervisors
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <87mu93vwy2.fsf@linaro.org>
 <fca8366e-662f-af2f-382c-0216d9df63f8@redhat.com> <87k147vu29.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <71f1773d-579d-fec9-cd49-e500bbca1bc4@redhat.com>
Date: Fri, 28 Feb 2020 12:21:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87k147vu29.fsf@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Wei Liu <liuw@liuw.name>, jan.kiszka@siemens.com,
 Stefano Stabellini <sstabellini@kernel.org>, virtio-dev@lists.oasis-open.org,
 virtualization@lists.linux-foundation.org
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

T24gMjgvMDIvMjAgMTI6MTgsIEFsZXggQmVubsOpZSB3cm90ZToKPj4gT1MgWCBIeXBlcnZpc29y
LmZyYW1ld29yayBqdXN0IHVzZXMgUUVNVSwgc28gaXQgY2FuIHVzZSB2aXJ0aW8gZGV2aWNlcwo+
PiB0b28uICBWaXJ0dWFsQm94IGFsc28gc3VwcG9ydHMgdmlydGlvIGRldmljZXMuCj4gSSBndWVz
cyB0aGVzZSBkb24ndCBkbyBhbnkgc29ydCBvZiB2aG9zdCBzdXBwb3J0IHNvIGFsbCB2aXJ0aW8g
ZGV2aWNlcwo+IGFyZSBoYW5kbGVkIGRpcmVjdGx5IGluIFFFTVU/CgpPUyBYIGNhbiB1c2Ugdmhv
c3QtdXNlci4KClBhb2xvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMu
bGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21h
aWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
