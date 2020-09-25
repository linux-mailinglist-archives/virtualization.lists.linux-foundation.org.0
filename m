Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC862787EA
	for <lists.virtualization@lfdr.de>; Fri, 25 Sep 2020 14:52:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2298486AEB;
	Fri, 25 Sep 2020 12:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ueb8A0mGighN; Fri, 25 Sep 2020 12:52:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5F3AE86BA6;
	Fri, 25 Sep 2020 12:52:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4553FC0859;
	Fri, 25 Sep 2020 12:52:06 +0000 (UTC)
X-Original-To: virtualization@lists.linuxfoundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C374CC0859
 for <virtualization@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 12:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AAAE886DC1
 for <virtualization@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 12:52:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2N1ox5XKYUF
 for <virtualization@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 12:52:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CF36086DC8
 for <virtualization@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 12:52:03 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id x23so2927202wmi.3
 for <virtualization@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 05:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BtOwqygZxNZk6oWCI22F6lqMw1LRPXvFIADZTQl+rOY=;
 b=fOjWrSyCvJQYpMmASANN0N5QLGO7rBHdRnm4ZVIiBVZlboHIMioFdOTj8nD0PTwhEv
 k/IGXoGYu3E5ubzC3bbcoLsONq5pPZuY1RfllMwg2CURFDzpYPe5K0cafBWCDhEU7dhp
 qp2WvHMxU24jfTi3SacCtzZjqZFRLXpuIkjsf3PZMjqGOEYktpXJZ//HQERRHsxDVfNG
 F7aQsxtpv9FimpmVRLFaU3JP/oMwKAcJ854HlbhxoZEvitK741+tB/KwWEP9DXYBl+Fy
 yRcExZhp/9sThFMQ+pFYyy8KLFlqKVS/a4D60ETPCuECkpiOfg6MMpPbJob43Qkdsz+8
 FiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BtOwqygZxNZk6oWCI22F6lqMw1LRPXvFIADZTQl+rOY=;
 b=XKuDSuksWNYQEUaHH2VprGKuxgEdfVSN9nu5obeGr/Zh+oFbUvhWK8Q9je3pzR9+Zg
 LbolauEs09/g/k7DWAjYWrfwogd6lTs7fZgqKNIJSU8FPDdJOKozzomAJHBID1EL2kgt
 coaRv5PymTWknzvv8YFyFUGlubD1GSZfs2XdWwW0iwExAc1AxfHxRs6xbRyaRt8DWj78
 kQ8dmRs0DDMB/Qbn4R1+6y6VFlvo3CDty7t0a46C7GoPsYr/vvYVGDtxenfxnPK+9lVy
 HwL/1APgFnnGTqPFJT6Ggs/gyyyXNhzpRIUFPV6N/RlODr+MVn732TEzG+0DaGLJ3K/s
 ubvA==
X-Gm-Message-State: AOAM5324ayyYTFRY4vK25Gb2RWu78JkeCHYVlQaIEWdRlxsugnHeF278
 ErhuJ03E2Wf1hhTemMtrgcmhaw==
X-Google-Smtp-Source: ABdhPJykzsVoFuABJlyF48BUdTgFdDhu4D6Z6tqvRMH73d8CJkJCXeBVJNsmCMLI+v2nkSCEGVIPrw==
X-Received: by 2002:a05:600c:252:: with SMTP id
 18mr2846464wmj.63.1601038322276; 
 Fri, 25 Sep 2020 05:52:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h17sm3046659wro.27.2020.09.25.05.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 05:51:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DB33B1FF93;
 Fri, 25 Sep 2020 13:51:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org, maxim.uvarov@linaro.org, joakim.bech@linaro.org,
 ilias.apalodimas@linaro.org, tomas.winkler@intel.com, yang.huang@intel.com,
 bing.zhu@intel.com, Matti.Moell@opensynergy.com, hmo@opensynergy.com
Subject: [RFC PATCH 07/19] tools/vhost-user-rpmb: implement
 --print-capabilities
Date: Fri, 25 Sep 2020 13:51:35 +0100
Message-Id: <20200925125147.26943-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200925125147.26943-1-alex.bennee@linaro.org>
References: <20200925125147.26943-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Cc: jean-philippe@linaro.org, takahiro.akashi@linaro.org,
 virtualization@lists.linuxfoundation.org, arnd@linaro.org,
 stratos-dev@op-lists.linaro.org
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

QSB2ZXJ5IHNpbXBsZSBjYXBhYmlsaXRpZXMgZHVtcC4KClNpZ25lZC1vZmYtYnk6IEFsZXggQmVu
bsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KLS0tCiB0b29scy92aG9zdC11c2VyLXJwbWIv
bWFpbi5jIHwgMTMgKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS90b29scy92aG9zdC11c2VyLXJwbWIvbWFpbi5jIGIvdG9vbHMvdmhv
c3QtdXNlci1ycG1iL21haW4uYwppbmRleCBhNDBhNjgwYTc0Y2EuLjZiMTk4OTEyNWJkNiAxMDA2
NDQKLS0tIGEvdG9vbHMvdmhvc3QtdXNlci1ycG1iL21haW4uYworKysgYi90b29scy92aG9zdC11
c2VyLXJwbWIvbWFpbi5jCkBAIC03LDYgKzcsNyBAQAogICovCiAKICNpbmNsdWRlIDxnbGliLmg+
CisjaW5jbHVkZSA8c3RkaW8uaD4KIAogc3RhdGljIGdjaGFyICpzb2NrZXRfcGF0aDsKIHN0YXRp
YyBnaW50IHNvY2tldF9mZDsKQEAgLTIwLDYgKzIxLDE0IEBAIHN0YXRpYyBHT3B0aW9uRW50cnkg
b3B0aW9uc1tdID0KICAgICB7IE5VTEwgfQogfTsKIAorLyogUHJpbnQgdmhvc3QtdXNlci5qc29u
IGJhY2tlbmQgcHJvZ3JhbSBjYXBhYmlsaXRpZXMgKi8KK3N0YXRpYyB2b2lkIHByaW50X2NhcGFi
aWxpdGllcyh2b2lkKQoreworICAgIHByaW50Zigie1xuIik7CisgICAgcHJpbnRmKCIgIFwidHlw
ZVwiOiBcImJsb2NrXCJcbiIpOworICAgIHByaW50ZigifVxuIik7Cit9CisKIGludCBtYWluIChp
bnQgYXJnYywgY2hhciAqYXJndltdKQogewogICAgIEdFcnJvciAqZXJyb3IgPSBOVUxMOwpAQCAt
MzMsNSArNDIsOSBAQCBpbnQgbWFpbiAoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICAgICAgICAg
ZXhpdCAoMSk7CiAgICAgfQogCisgICAgaWYgKHByaW50X2NhcCkgeworICAgICAgICBwcmludF9j
YXBhYmlsaXRpZXMoKTsKKyAgICAgICAgZXhpdCgwKTsKKyAgICB9CiAKIH0KLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6
YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Zp
cnR1YWxpemF0aW9u
