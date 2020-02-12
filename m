Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D30A159E2E
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 01:41:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 02CC92034B;
	Wed, 12 Feb 2020 00:41:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Car3UgZnjN-s; Wed, 12 Feb 2020 00:41:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4165B203A5;
	Wed, 12 Feb 2020 00:41:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2361EC1D8E;
	Wed, 12 Feb 2020 00:41:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18F35C07FE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 00:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 07182842E9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 00:41:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y8CA9X7Wqsgz
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 00:41:30 +0000 (UTC)
X-Greylist: delayed 00:19:32 by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8459B83659
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 00:41:30 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id n21so202149ioo.10
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 16:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=5W5I2/tliGJReRotTu8QzhtFOiqoykAjsJm5H9qMpkY=;
 b=aLqA2Qf2b5R0VeGpxHSJiz0ggv1GoXh8FkTKNgcixlXD0g0v+K4kZAA5jZFyv0sCI/
 k0dJCcEfwvaKmSPcMS6sYRNmiJipBsJiNcMrzUp11mrEiAinkTJ+ko4yfFP9yXEn4y3s
 dyA96FXoI6LjOw0qu4i2uDrCTfErIfqttgHTCx6WrFtH//2lrSt6dZyYWS4U6K1kX9BV
 xuRArF8oKa7WeB6uDD1J0XE+ev7h8H/ZUv5ik+syqG8rdvvCV3KqoPQegqqiprtWD2kf
 PStGiVD5hcbq6hw+dhNe5Y4uO5at0WVISTk9JNb50USIQWVd+3kKZo+3vyNgEyTZ1xHc
 bl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=5W5I2/tliGJReRotTu8QzhtFOiqoykAjsJm5H9qMpkY=;
 b=AR8ZVh5jNXL9l3dRpj3837IBpDHc+L1jFMa71R5vkUDC0YLFBXvDGRgcaGVF8nUhgj
 4jcSwbBp3ieO0+jQQd16RDPO1Ch03H4PV0f/7smfJeTmRe9o2+h8pbSkPS5SVodXwMFA
 ngPs02tsR9RY+p8JumhT47rUlPSiiGtOffvjcxOmbJ4EaD2Mx4dZ1+tk3VlUu5OwPb26
 wYEMqc+3wnA7xCA+ZoyUaO21jttQSGsIeJpWCmtWh9Ro4lFai35zboR6r2ksKOvGqxYv
 IA9HEk7UDiybTLvFkQgiwokO5lUDirNUuH9WkomoQKC9U98btzWo5EoR/dZgI4gnhOGg
 4PHA==
X-Gm-Message-State: APjAAAWCbH/NxSbgXXXiWoaGMhvaPJYjatexuXoW7b/5HRhywrJUvl2D
 NiGWsyyFcCXfNyHPlrxBPKZymU4tgkw=
X-Google-Smtp-Source: APXvYqwKbe3ZKkA0o3k4bVYltcFG8rs9iaVtk+dJZWxF/gbWUmftd2FJbB2uXTGUG7Se4Mvk4yh6GA==
X-Received: by 2002:a63:480f:: with SMTP id v15mr9328311pga.201.1581466509526; 
 Tue, 11 Feb 2020 16:15:09 -0800 (PST)
Received: from ?IPv6:2600:1010:b06b:b0e7:939:1384:befb:d8c9?
 ([2600:1010:b06b:b0e7:939:1384:befb:d8c9])
 by smtp.gmail.com with ESMTPSA id s6sm5044170pgq.29.2020.02.11.16.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 16:15:08 -0800 (PST)
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 50/62] x86/sev-es: Handle VMMCALL Events
Date: Tue, 11 Feb 2020 16:14:53 -0800
Message-Id: <DC865D59-CAD2-4D1C-919B-1C954B1EFFB1@amacapital.net>
References: <20200211135256.24617-51-joro@8bytes.org>
In-Reply-To: <20200211135256.24617-51-joro@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>
X-Mailer: iPhone Mail (17D50)
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>
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

Cgo+IE9uIEZlYiAxMSwgMjAyMCwgYXQgNTo1MyBBTSwgSm9lcmcgUm9lZGVsIDxqb3JvQDhieXRl
cy5vcmc+IHdyb3RlOgo+IAo+IO+7v0Zyb206IFRvbSBMZW5kYWNreSA8dGhvbWFzLmxlbmRhY2t5
QGFtZC5jb20+Cj4gCj4gSW1wbGVtZW50IGEgaGFuZGxlciBmb3IgI1ZDIGV4Y2VwdGlvbnMgY2F1
c2VkIGJ5IFZNTUNBTEwgaW5zdHJ1Y3Rpb25zLgo+IFRoaXMgcGF0Y2ggaXMgb25seSBhIHN0YXJ0
aW5nIHBvaW50LCBWTU1DQUxMIGVtdWxhdGlvbiB1bmRlciBTRVYtRVMKPiBuZWVkcyBmdXJ0aGVy
IGh5cGVydmlzb3Itc3BlY2lmaWMgY2hhbmdlcyB0byBwcm92aWRlIGFkZGl0aW9uYWwgc3RhdGUu
Cj4gCgpIb3cgYWJvdXQgd2UganVzdCBkb27igJl0IGRvIFZNTUNBTEwgaWYgd2XigJlyZSBhIFNF
Vi1FUyBndWVzdD8gIE90aGVyd2lzZSB3ZSBhZGQgdGhvdXNhbmRzIG9mIGN5Y2xlcyBvZiBleHRy
YSBsYXRlbmN5IGZvciBubyBnb29kIHJlYXNvbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
