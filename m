Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AF4443E1E
	for <lists.virtualization@lfdr.de>; Wed,  3 Nov 2021 09:12:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EDE580EA4;
	Wed,  3 Nov 2021 08:12:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kVX7rgRwm_SH; Wed,  3 Nov 2021 08:12:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6238480E99;
	Wed,  3 Nov 2021 08:12:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2A3CC000E;
	Wed,  3 Nov 2021 08:12:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18DB2C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Nov 2021 08:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF33880E83
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Nov 2021 08:12:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yzknNhv2-l0H
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Nov 2021 08:12:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5960F80E81
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Nov 2021 08:12:36 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d3so2219039wrh.8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 03 Nov 2021 01:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uh0NRCclsAKfVxkerpNkq71adkos81CcdIhWKjRw+6Y=;
 b=mr5PnPgRO8OzuCvJMvW5hnrKT6fvInL0UAalZ989hyaB3jvVYItDW8ou3liJfIJoNr
 hvWaf54dIpbnxdcc373Xcvqh9M6HM18knXjMfLH8s9y9SqdcLaOWvj2x7DpcCaGzVFbZ
 lRKQhbmITsNkhjsS4nGlQr7p3Lx9KbhcIkcbZuEMqIiRnZFQq9nQAgmb7jI6kyyIYGVr
 8DuN2xfiamK0PB5ZXxLNCXVJmkxa0CufWXYNL8NcvGDnhKDuJsd3OrctTS27BMaV18TM
 rng6LYJfdT4RIcJrOUvee5IGHT8G8Pg1qV1oMpUStS5iXhzHspZdxG0dOEiTdyYrycJK
 yKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uh0NRCclsAKfVxkerpNkq71adkos81CcdIhWKjRw+6Y=;
 b=BBBHU8VfY1OJObpup/Bm3YPePbOCzL0BZwlMGtpxxWd1h/Fh51cBjkwUrkiHTFTN6u
 sBjN0Zf+GVgcDIN21WNE2g1YNIqEZ4pW+Ie17cp1/JK32cUfEiHxp1PxOXay4qeSMzjb
 83sGzBqm2+qvouLz9gna4PU1GVF4XN0tgUjZZPY0JMEuXzuinkhDXN2b9hg0GBbSe/6S
 FT4/hjJngVPdAkemjEBNNtGAXSWATErQ16BrKYJU68ZUJuNbg5sBeYSooEfjBKx9Wr4h
 1FJ38MPUivlwJymPrIY0GmneDuIPWi27pcSavN8xHapM2br99RxM2PizetBGN6AyRLSk
 iUFg==
X-Gm-Message-State: AOAM533+vb0uh4V2ZxmkuKObahK9ynAdYuGRabvZq9UG9oStDWwWDikn
 UZwwS5Qoh0ReM9So2vTRakc=
X-Google-Smtp-Source: ABdhPJw1BshvZSVxZm2e89H/8z2XLrQccFGIz7m0oW1jDggouT+C66c3Yi239msG+Ek/pKeY2cfj0A==
X-Received: by 2002:adf:fe88:: with SMTP id l8mr33010703wrr.208.1635927154697; 
 Wed, 03 Nov 2021 01:12:34 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l7sm1450088wry.86.2021.11.03.01.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 01:12:34 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, etnaviv@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org
Subject: DMA-buf debugfs cleanups
Date: Wed,  3 Nov 2021 09:12:27 +0100
Message-Id: <20211103081231.18578-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: sumit.semwal@linaro.org, daniel@ffwll.ch, l.stach@pengutronix.de
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Hi guys,

second round for those four patches adding some simple yet useful DMA-buf helper functions for debugfs prints.

Fixed some missing includes and typos in commit messages.

Please review and/or comment,
Christian.


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
